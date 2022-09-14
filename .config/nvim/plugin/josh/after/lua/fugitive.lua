local map = vim.keymap.set
map("n", ",","<cmd>set hlsearch! hlsearch?<cr>",{noremap=true})
map( "n", "<leader>gs", "<cmd>G<CR>",{noremap=true})
map("n", "<leader>gf", "<cmd>diffget //2<CR>", {noremap=true})
map("n", "<leader>gh", ":diffget //3<CR>",{noremap=true})

map("n", "<leader>gsa", "<cmd>Git add %<CR>",{noremap=true})

