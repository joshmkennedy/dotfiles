require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "css", "scss",},
		additional_vim_regex_highlighting = {
			"php","twig",
		},
	},
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	indentation = {
		enable = true,
		disable = {"php"}
	},
})

