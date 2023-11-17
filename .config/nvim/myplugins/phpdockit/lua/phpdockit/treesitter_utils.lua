local parsers = require("nvim-treesitter.parsers")

local M = {}

function M.get_root(filetype, bufnr)
	local parser = parsers.get_parser(bufnr, filetype)

	if not parser then
		error("No treesitter parser found. Install one using :TSInstall <language>")
	end

	return parser:parse()[1]:root()
end

function M.walk_up_until(starting_node, type_name)
	local curr = starting_node
	while curr ~= nil and not vim.tbl_contains(type_name, curr:type()) do
		curr = curr:parent()
	end

	return curr
end

function M.get_sexpr(name)
	return string.format("(%s) @tmp_capture", name)
end

function M.find_occurrences(scope, sexpr, ft, bufnr)
	if not sexpr:find("@") then
		sexpr = sexpr .. " @tmp_capture"
	end

	local ok, sexpr_query = pcall(vim.treesitter.parse_query, ft, sexpr)
	if not ok then
		error(string.format("Invalid query: '%s'\n error: %s", sexpr, sexpr_query))
	end

	local occurrences = {}
	for _, n in sexpr_query:iter_captures(scope, bufnr, 0, -1) do
		table.insert(occurrences, n)
	end

	return occurrences
end


function M.captures_from_query(sexpr, node, lang, error_msg)
	local ok,sexpr_q =
		pcall(vim.treesitter.parse_query, lang, sexpr)
	if not ok then
		if error_msg ~= nil then
			error(error_msg)
		else
			error("Could not find a match for "..sexpr)
		end
	end
	return sexpr_q:iter_captures(node,0,0,-1)
end


return M

-- __eq = <function 1>,
-- __index = <table 1>,
-- __len = <function 2>,
-- __tostring = <function 3>,
-- _rawquery = <function 4>,
-- byte_length = <function 5>,
-- child = <function 6>,
-- child_count = <function 7>,
-- descendant_for_range = <function 8>,
-- end_ = <function 9>,
-- field = <function 10>,
-- has_error = <function 11>,
-- id = <function 12>,
-- iter_children = <function 13>,
-- missing = <function 14>,
-- named = <function 15>,
-- named_child = <function 16>,
-- named_child_count = <function 17>,
-- named_children = <function 18>,
-- named_descendant_for_range = <function 19>,
-- next_named_sibling = <function 20>,
-- next_sibling = <function 21>,
-- parent = <function 22>,
-- prev_named_sibling = <function 23>,
-- prev_sibling = <function 24>,
-- range = <function 25>,
-- root = <function 26>,
-- sexpr = <function 27>,
-- start = <function 28>,
-- symbol = <function 29>,
-- type = <function 30>

--[[[ WHAT TAGS LOOKS LIKE
	{ {
    tag_name = "@param",
    type_list = "Finger",
    variable_name = "$finger"
  }, {
    tag_name = "@param",
    type_list = "int",
    variable_name = "$time"
  }, {
    tag_name = "@return",
    type_list = "string"
  } }
--]]

