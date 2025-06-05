local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { noremap = true })
map("n", "<leader>q", "<cmd>x<cr>", { noremap = true })

map("n", "<leader>,", "<cmd>set hlsearch! hlsearch?<cr>", { noremap = true })

-- MOTIONS
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
map("n", "<leader>[", ":cp<CR>", { noremap = true })
map("n", "<leader>]", ":cn<CR>", { noremap = true })
map("n", "<leader>o", "o<esc>", { noremap = true })
map("n", "<leader>O", "O<esc>", { noremap = true })


--" Highlights a function
map("n", "<leader>hf", "Vf{%", { noremap = true })
map("v", "<leader>hf", "f{%", { noremap = true })

-- make file executable
map("n", "<leader>xx", ":!chmod +x %<CR>", { noremap = true })

--" TERM
map("t", "<esc>", "<C-\\><C-n>", {})
map("t", "<C-h>", "<C-\\><C-n><c-w>h", {})
map("t", "<C-l>", "<C-\\><C-n><c-w>l", {})


