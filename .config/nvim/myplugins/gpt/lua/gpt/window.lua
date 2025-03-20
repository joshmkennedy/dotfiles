local Split = require("nui.split")
local event = require("nui.utils.autocmd").event
local utils = require("gpt.utils")

local Component = {
	exitOnLeave = true,
	ui = nil
}

function Component:new()
	local state = {
		exitOnLeave = true,
		ui = nil,
		mounted = false
	}
	setmetatable(state, self)
	self.__index = self
	return state
end

function Component:createSplit(relative, position, size, enter)
	self.ui = Split({
		relative = relative,
		position = position,
		size = size,
		enter = enter
	})
end

function Component:mountComponent()
	-- mount/open the component
	if not self.mounted then
		self.ui:mount()
		self.mounted = true
	end
end

function Component:showComponent()
	self.ui:show()
end

function Component:mountAndShowComponent()
	self:mountComponent()
	self:showComponent()
end

function Component:hideComponent()
	self.ui:hide()
end

function Component:setBufLeave()
	-- unmount component when cursor leaves buffer
	self.ui:on(event.BufLeave, function()
		if self.exitOnLeave then
			self:hideComponent()
		end
	end)
end

function Component:setContents(contentTbl)
	local buf = self.ui.bufnr
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, contentTbl)
end

function Component:setFileType()
	vim.api.nvim_buf_set_option(self.ui.bufnr, "filetype", utils.filetype())
end

return Component
