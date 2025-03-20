local map = vim.keymap.set
--
require 'snacks'.setup({
	words = { enabled = true },
	picker = { enabled = true }
})

-- Maps for local lsp reference (words) jumping
map("n", "g]", function()
	Snacks.words.jump(1, true)
end, { noremap = true })

map("n", "g[", function()
	Snacks.words.jump(-1, true)
end, { noremap = true })

-- Picker keymaps
