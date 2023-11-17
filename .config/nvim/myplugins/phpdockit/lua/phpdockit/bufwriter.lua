local utils = require("phpdockit.utils")

local M = {}

function M.write(start_col, content)
	local lines_after = vim.api.nvim_buf_get_lines(0, start_col, -1, false)
	local content_line_count = #content
	local cursor_pos = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())
	local lines = utils.tableConcat(content, lines_after)


	vim.api.nvim_buf_set_lines(0, start_col, -1, false, lines)
	--set cursor position
	vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { cursor_pos[1] + content_line_count, cursor_pos[2] })
end

return M
