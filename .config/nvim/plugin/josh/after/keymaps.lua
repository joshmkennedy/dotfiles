local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>,","<cmd>set hlsearch! hlsearch?<cr>",{noremap=true})
-- QUICK
map("n", "<leader>w","<cmd>w<cr>", {noremap=true})
map("n", "<leader>q","<cmd>x<cr>", {noremap=true})

-- MOTIONS
-- map("i", "jj","<esc>",{noremap=true})
map("i", "<C-c>","<esc>")

map("v", "J", ":m '>+1<CR>gv=gv", {noremap=true})
map("v","K",":m '<-2<CR>gv=gv", {noremap=true})
map("n","<leader>[",":cp<CR>", {noremap=true})
map("n","<leader>]" ,":cn<CR>", {noremap=true})
map("n","<leader>o", "o<esc>", {noremap=true})
map("n","<leader>O", "O<esc>", {noremap=true})

--
-- TELESCOPE
map("n","<leader>ff", ":Telescope find_files prompt_prefix=🔍<CR>",{noremap=true})
map("n","<leader>gg", ":Telescope live_grep prompt_prefix=🦖<CR>",{noremap=true})
map("n","<leader>hh", ":Telescope harpoon marks<CR>", {noremap=true})
map("n","<leader>tt", ":Telescope resume<CR>",{noremap=true})

--" Highlights a function
map("n","<leader>hf", "Vf{%",{noremap=true})
map("v","<leader>hf", "f{%",{noremap=true})

--" Netrw
map("n","<leader>e", ":Ex<CR>",{noremap=true})

--CONFIG HELP
map("n","<leader>r", ":so %<CR>", {noremap=true})

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end
-- map("n", "<leader>R", function() R() end, {noremap=true})

map("n","<leader>xx", ":!chmod +x %<CR>",{noremap=true})


--" TERM

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")

vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point messages: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

map("n", "<leader>do", ":lua require('dapui').open()")

vim.api.nvim_create_user_command( 'Fd', function ()vim.lsp.buf.format()end, {})
--LUASNIP
-- TODO:

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
local ls = require "luasnip"
vim.keymap.set({ "i", "s"  }, "<c-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {noremap=true, silent = true  })

vim.keymap.set({ "i", "v" }, "<c-n>", function()
	if ls.expand_or_locally_jumpable() then
		ls.expand_or_jump()
	end
end, {noremap=true, silent = true  })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set({"i","s"}, "<c-u>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end,{noremap=true})

-- vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")



map("n","<leader>ha",function() require("harpoon.mark").add_file()end,{})
map("n","<leader>hm",function() require("harpoon.ui").toggle_quick_menu()end,{})
map("n","<leader>1",function()require("harpoon.ui").nav_file(1)end,{})
map("n","<leader>2",function()require("harpoon.ui").nav_file(2)end,{})
map("n","<leader>3",function()require("harpoon.ui").nav_file(3)end,{})
map("n","<leader>4",function()require("harpoon.ui").nav_file(4)end,{})

-- keymap to open Telescope builtins 
map("n","<leader>T", ":Telescope builtin prompt_prefix=🔍<CR>",{noremap=true})
-- CODIUM
vim.keymap.set('i', '<C-o>', function ()
	return vim.fn['codeium#Accept']()
end, { expr = true })
