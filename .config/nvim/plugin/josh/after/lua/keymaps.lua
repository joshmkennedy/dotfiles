local map = vim.keymap.set

vim.mapleader = " "

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
--
-- TELESCOPE
map("n","<leader>ff", ":Telescope find_files prompt_prefix=🔍<CR>",{noremap=true})
map("n","<leader>gg", ":Telescope live_grep prompt_prefix=🦖<CR>",{noremap=true})
map("n","<leader>hh", ":Telescope harpoon marks<CR>", {noremap=true})
map("n","<leader>tt", ":Telescope resume<CR>",{noremap=true})

--" Highlights a function
map("n","<leader>hf", "Vf{%",{noremap=true})

--" Netrw
map("n","<leader>e", ":Ex<CR>",{noremap=true})

--COPILOT
map("n", "<silent><script><expr> <C-O>", "copilot#Accept('<CR>')", {noremap=true})
vim.g.copilot_no_tab_map = true

--CONFIG HELP
map("n","<leader>r", ":so %<CR>", {noremap=true})

map("n","<leader>xx", ":!chmod +x %<CR>",{noremap=true})

--" EMMET
map("i", "<C-a>", "<C-y>,",{noremap=true})

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

-- FUGITIVE

