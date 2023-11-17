local api = vim.api
local search_window = require 'search-gui.layout'
local setup_maps = require 'search-gui.keymaps'
local cmds = require 'search-gui.cmd'
local set_content = require 'search-gui.buf_contents'

setup_maps({
	cmds = {
		enter_cmd = function(bufnr)
			cmds.search(search_window)
		end,
		tab_cmd = function(bufnr)
			cmds.focus_next(search_window)
		end,
	},
	popups = {
		{
			popup = search_window.search_popup,
			cmds = {
				{
					mode = "i",
					lhs = "<enter>",
					rhs = function(bufnr)
						cmds.search(search_window)
					end,
				},
			}
		},
		{
			popup = search_window.include_files_popup,
		},
		{
			popup = search_window.exclude_files_popup,
		},
	}
})

set_content.set_default_file_pattern(search_window.include_files_popup.bufnr, "**/*.*")
set_content.set_wild_ignore_lines(search_window.exclude_files_popup.bufnr)

local function open_search_window()
	if search_window.is_layout_shown == false then
		search_window.show_layout()
	end
end

return {
	open_search = open_search_window
}
