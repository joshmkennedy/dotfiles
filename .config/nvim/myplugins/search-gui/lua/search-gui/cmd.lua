local M = {}

M.search = function (search_window)
	local search_lines = vim.api.nvim_buf_get_lines(search_window.search_popup.bufnr, 0, 1, false)
	local include_file_lines = vim.api.nvim_buf_get_lines(search_window.include_files_popup.bufnr, 0, 1, false)

	local og_wildignore = vim.o.wildignore
	local exclude_file_lines = vim.api.nvim_buf_get_lines(search_window.exclude_files_popup.bufnr, 0, -1, false)
	vim.o.wildignore = vim.fn.join(exclude_file_lines,",")

	search_window.hide_layout()
	local search_pattern = search_lines[1];
	local include_files = include_file_lines[1];

	local cmd = 'vimgrep /' .. search_pattern .."/ " .. include_files

	local search_cmd = function(c)
		vim.cmd(c)
	end
	local success, _, err = pcall(search_cmd, cmd)
	if success == false then
		P(err)
	end
	vim.o.wildignore = og_wildignore
	vim.cmd("stopinsert")
end

M.focus_next = function (search_window)
	local len = #search_window.popup_win_ids
	local next_focus_index = search_window.current_focus + 1
	if next_focus_index > len then
		next_focus_index = 1
	end
	M.current_focus = next_focus_index
	vim.api.nvim_set_current_win(M.popup_win_ids[M.current_focus])
end

return M
