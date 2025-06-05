return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	opts = {
		use_default_keymaps = false,
	},

	keys = {
		{
			"<leader>j",
			"<cmd>TSJToggle<cr>",
			desc = "Join Toggle",
		},
	},
}
