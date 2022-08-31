local Job = require "plenary.job"
local ts_utils = require("nvim-treesitter.ts_utils");
local parsers = require("nvim-treesitter.parsers");

local source = {}

source.new = function()
  local self = setmetatable({ cache = {} }, { __index = source })

  return self
end

function has_config()
  local cwd =  vim.fn.getcwd()
  local f = io.open(cwd .. "/init.lua");
  if f ~=nil then io.close(f) return true else return false end
end

function get_config()
  if not has_config() then return nil end
  local cwd =  vim.fn.getcwd()
  file = io.open(cwd.."/init.lua")
  io.input(file)
  lines = io.read("*all")
  fn = loadstring(lines)
  _config = fn()
  return _config
end

_config = get_config()
source.complete = function(self, _, callback)
  local bufnr = vim.api.nvim_get_current_buf()

  -- This just makes sure that we only hit the GH API once per session.
  --
  -- You could remove this if you wanted, but this just makes it so we're
  -- good programming citizens.
  if not self.cache[bufnr] then

    local cwd =  vim.fn.getcwd()
    P(cwd)
    
    local items = {}

      if not has_config() then
        return nil
      end

      if not _config then 
        _config = get_config()
      end

      filepath = _config.css_vars_path
      file = io.open(filepath)
      io.input(file)
      lines = io.read("*all")

      P(_config.css_vars_path)
      vars = get_vars(lines)
      P(vars)
      io.close(file)
      for _, var in ipairs(vars) do
        table.insert(items, {
          label = var.name,
          kind = 6,
          documentation = {
            value = var.value,
            kind="variable",
          },
        })
      end

    callback { items = items, isIncomplete = false }
    self.cache[bufnr] = items

  else
     
    callback { items = self.cache[bufnr], isIncomplete = false }

  end
end

source.get_trigger_characters = function()
  return { "-" }
end

source.is_available = function()
  return vim.bo.filetype == "css"
end

require("cmp").register_source("css_vars", source.new()) 

--TREESITTER
--
function get_sexpr(name)
    return string.format("(%s) @tmp_capture", name)
end

function get_root(filetype, file_contents)
    local parser = vim.treesitter.get_string_parser(file_contents, filetype)

    if not parser then
        error(
            "No treesitter parser found. Install one using :TSInstall <language>"
        )
    end

    return parser:parse()[1]:root()
end

function find_occurrences(scope, sexpr, ft, file_contents)

    if not sexpr:find("@") then
        sexpr = sexpr .. " @tmp_capture"
    end

    local ok, sexpr_query = pcall(vim.treesitter.parse_query, ft, sexpr)
    if not ok then
        error(
            string.format("Invalid query: '%s'\n error: %s", sexpr, sexpr_query)
        )
    end

    local occurrences = {}
    for _, n in sexpr_query:iter_captures(scope, file_contents, 0, -1) do
        table.insert(occurrences, n)
    end
    
    return occurrences
end

function starts_with(str, start)
  return str:sub(1, #start) == start
end

function get_vars(lines)
    root = get_root("css", lines)
    properties = find_occurrences(root, get_sexpr("property_name"), "css", lines)
    vars = {}
    for _, property_node in ipairs(properties) do

      
       prop_name = vim.treesitter.get_node_text(property_node,lines)
       if starts_with(prop_name, "--") then
          parent = property_node:parent()
          prop_value = vim.treesitter.get_node_text(parent:child(2), lines)
          table.insert(vars, {name = prop_name, value = prop_value})
       end
    end
    return vars
end


function split (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end


