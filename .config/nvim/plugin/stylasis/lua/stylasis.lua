parsers = require("nvim-treesitter.parsers")
api = vim.api

local M = {}

function M.query_specificity()
	local parser = parsers.get_parser(0, "css")

	local	root = parser:parse()[1]:root()

	local children = root:iter_children()()
	P(getmetatable(children:child():sexpr()))

	return root
end

return M
