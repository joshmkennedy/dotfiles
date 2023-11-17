local Popup = require 'nui.popup'
local Layout = require "nui.layout"

local M = {}

local popup_one, popup_two, popup_three = Popup({
	enter = true,
	border = {
		style = "single",
		text = {
			top = "Search Pattern",
			top_align = "left",
		},
	},
}), Popup({
	border = {
		style = "single",
		text = {
			top = "Include Pattern",
			top_align = "left",
		},
	},
}), Popup({
	border = {
		style = "single",
		text = {
			top = "Exclude Pattern",
			top_align = "left",
		},
	},
})

local layout = Layout(
	{
		relative = "editor",
		position = "50%",
		size = {
			width = 80,
			height = 30,
		},
	},
	Layout.Box({
		Layout.Box(popup_one, { size = "10%" }),
		Layout.Box(popup_two, { size = "10%" }),
		Layout.Box(popup_three, { size = "80%" }),
	}, { dir = "col" })
)

M.search_popup = popup_one
M.include_files_popup = popup_two
M.exclude_files_popup = popup_three
M.layout = layout

M.is_layout_mounted = false
M.is_layout_shown = false

M.current_focus = 1
M.popup_win_ids = {
	M.search_popup.winid,
	M.include_files_popup.winid,
	M.exclude_files_popup.winid,
}

M.show_layout = function()
	if M.is_layout_mounted == false then
		M.layout:mount()
		M.is_layout_mounted = true
		M.is_layout_shown = true
	end
	if M.is_layout_shown == false then
		M.layout:show()
		M.is_layout_shown = true
	end
end

M.hide_layout=function()
	if M.is_layout_shown == true then
		M.layout:hide()
		M.is_layout_shown = false
	end
end

return M
