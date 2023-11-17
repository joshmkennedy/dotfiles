local tree_utils = require("phpdockit.treesitter_utils")
local function_parse = require'phpdockit.function_parsing'
local ts_utils = require("nvim-treesitter.ts_utils")
local bufwriter = require("phpdockit.bufwriter")

-- main exports

local M = {}

function M.create_function()
	local node = ts_utils.get_node_at_cursor()
	local phpdoc_node_type = { "document" }
	if not phpdoc_node_type then
		error("AN ERROR OCCURRED at the very begininningggg")
	end

	local document_node = tree_utils.walk_up_until(node, phpdoc_node_type)
	if not document_node then
		P("Not inside a phpdoc Comment")
		return {}
	end

	-- Function name and maybe type of generator ie class, function, etc
	local name_node = nil
	local error_msg = "No Title Found, Please add # <Function Name> at the top"
	for _, text in tree_utils.captures_from_query(
		'(description (text) @name (#contains? @name "#"))',
		document_node,
		"phpdoc",
		error_msg
	) do
		name_node = vim.treesitter.query.get_node_text(text, 0, {})
	end

	local name = name_node:gsub("# ", "")

	-- tags in comment
	local tags = {}
	local tag_error_msg = "No phpdoc Tags were found. Check your syntax"
	for _, tag in tree_utils.captures_from_query("(tag) @tmp_capture", document_node, "phpdoc", tag_error_msg) do
		-- tag in tags group
		local tag_parts = {}
		local name_error_msg = "Not all parts could be parsed"
		for _, part in tree_utils.captures_from_query(
			"(tag_name) @tmp_capture (type_list) @tmp_capture (variable_name) @tmp_capture",
			tag,
			"phpdoc",
			name_error_msg
		) do
			tag_parts[part:type()] = vim.treesitter.query.get_node_text(part, 0, {})
		end
		table.insert(tags, tag_parts)
	end

	local tags_as_strings = ""
	for _, tag in ipairs(tags) do
		if tag.tag_name == "@param" then
			tags_as_strings = tags_as_strings .. tag.variable_name .. ", "
		end
	end

	-- printing
	local content = { "function " .. name .. "( " .. tags_as_strings .. "){", "\t //TODO:", "}" }
	bufwriter.write(document_node:end_() + 1, content)
end

function M.create_doc()
	local node = ts_utils.get_node_at_cursor()
	local function_type = { "function_definition", "method_declaration" }

	local func_node = tree_utils.walk_up_until(node, function_type)
	if func_node == nil then
		P("not in a function buddy")
		return {}
	end

	-- BUILDS OUT EACH PARAMETER
	local paramsquery = "( formal_parameters ( simple_parameter ) @variable)"
	local parameters = {}
	for _, parameter in tree_utils.captures_from_query(paramsquery, func_node, "php", "dang it") do
		local param = function_parse.parse_param(parameter)
		table.insert(parameters, param)
	end

	-- BUILDS THE DOC STRING
	local _, col = func_node:start()
	local docstring = { M.indent(col) .. "/**" }
	for _, param in ipairs(parameters) do
		table.insert(docstring, M.fmt_param_docstring(param, col))
	end
	table.insert(docstring, M.indent(col) .. " */")

	bufwriter.write(func_node:start(), docstring)
end

function M.fmt_param_docstring(param, col)
	local docstring = M.indent(col) .. " * @param"
	if param.type then
		docstring = docstring .. " " .. param.type
	else
		docstring = docstring .. " mixed"
	end
	if param.name then
		docstring = docstring .. " " .. param.name
	end
	if param.default_value then
		docstring = docstring .. " defaults to " .. param.default_value
	end
	return docstring
end

function M.indent(count)
	return string.rep(" ", count)
end

return M
