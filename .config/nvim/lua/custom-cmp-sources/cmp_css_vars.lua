local Job = require "plenary.job"
local ts_utils = require("nvim-treesitter.ts_utils");
local parsers = require("nvim-treesitter.parsers");

local source = {}

source.new = function()
  local self = setmetatable({ cache = {} }, { __index = source })

  return self
end

source.complete = function(self, _, callback)
  local bufnr = vim.api.nvim_get_current_buf()

  -- This just makes sure that we only hit the GH API once per session.
  --
  -- You could remove this if you wanted, but this just makes it so we're
  -- good programming citizens.
  if not self.cache[bufnr] then

    local cwd = vim.fn.getcwd()
      -- files = split(files, "\n")
    P(cwd)
    
    local items = {}

      file = io.open( files[1], "r")
      io.input(file)
      lines = io.read("*all")

      vars = get_vars(lines)
      io.close(file)
      P(vars)
      for _, var in ipairs(vars) do
        table.insert(items, {
          label = var.name,
          kind = 6,
          documentation = {
            kind = "variable",
            value = var.value,
          },
        })
      end
    P(items)
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
       prop_name = "--var";
       if starts_with(prop_name, "--") then
          prop_value = "value";
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

function get_node_text(content,startline, startcol, endline, endcol)
  lines = split(content, "\n")
  local start_line = startpos.line
  local start_col = startpos.col
  local end_col = endpos.col
  local start_line_text = lines[start_line]
  text = start_line_text:sub(start_col, end_col)
  return text
end

