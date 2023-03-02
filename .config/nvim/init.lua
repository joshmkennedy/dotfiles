require("init")
local map = vim.keymap.set

vim.api.nvim_create_user_command("DelTabMap","lua vim.api.nvim_del_keymap('i','<Tab>')",{})
vim.api.nvim_create_user_command("FSH","setfiletype sh",{});


