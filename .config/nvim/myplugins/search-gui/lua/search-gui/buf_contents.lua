local utils = require'search-gui.utils'

local M = {}

M.set_default_file_pattern = function (bufnr, pattern)
	vim.api.nvim_buf_set_lines(bufnr, 0,1, false,{pattern})
end

M.set_wild_ignore_lines = function(bufnr)
	local ignoring = vim.o.wildignore
	local files = utils.split(ignoring, ",")
	local len = #files
	vim.api.nvim_buf_set_lines(bufnr, 0,len,false,files)
end


return M

