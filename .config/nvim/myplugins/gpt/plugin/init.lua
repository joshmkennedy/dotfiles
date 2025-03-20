local utils = require("gpt.utils")
local refactorM = require("gpt.refactor")
local window = require("gpt.window")
local codeitM = require("gpt.codeit")
--TODO: make a split buffer when code is returned with the code

local refactor = refactorM:new()
refactor.window:createSplit("editor", "right", "50%", false)
local codeit =codeitM:new()
codeit.window:createSplit("editor", "right", "50%", false)

vim.api.nvim_create_user_command("GptRefactor", function(with)
		refactor.window:mountComponent()
		refactor.window:setBufLeave()
		refactor:run(
			vim.fn.input("How should it be refactored? > "),
			with,
			function(message)
				vim.notify("Done!")
				refactor.window:setContents(utils.splitStr(message, "\n"))
				refactor.window:setFileType()
			end)
		refactor.window:showComponent()
		refactor.window:setContents({ "Loading..." })
	end,
	{
		range = true,
		force = true,
	})

vim.api.nvim_create_user_command("GptCode", function(with)
		codeit.window:mountComponent()
		codeit.window:setBufLeave()
		codeit:run(
			vim.fn.input("What you want to code? > "),
			with,
			function(message)
				vim.notify("Done!")
				codeit.window:setContents(utils.splitStr(message, "\n"))
				vim.api.nvim_buf_set_option(codeit.window.ui.bufnr, "filetype", "markdown")
			end)
		codeit.window:showComponent()
		codeit.window:setContents({ "Loading..." })
	end,
	{
		range = true,
		force = true,
	})


local commands = {
    { name = "GPTOpenCode", component = codeit.window },
    { name = "GPTOpenRefactor", component = refactor.window },
}
-- Loop over the config table and create user commands
for _, command in ipairs(commands) do
    vim.api.nvim_create_user_command(command.name, function()
        command.component:showComponent()
    end, {})
end
--
