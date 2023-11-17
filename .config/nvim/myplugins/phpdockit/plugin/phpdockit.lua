local phpdockit = require'phpdockit'

-- all built in interfacing with plugin will go here
--
vim.api.nvim_create_user_command("DockitFunc", function()
	phpdockit.create_function()
end, {})

vim.api.nvim_create_user_command("DockitDoc", function()
	phpdockit.create_doc()
end, {})
