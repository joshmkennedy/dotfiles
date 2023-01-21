require("init")
vim.opt.autoindent = true

vim.api.nvim_create_user_command("DelTabMap","lua vim.api.nvim_del_keymap('i','<Tab>')",{})

