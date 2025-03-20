require("supermaven-nvim").setup({
	keymaps={
		accept_suggestion = "<C-h>"
	},
	color = {
		suggestion_color = "#5D769C",
		cterm = 244,
	},
	-- disable_inline_completion = true,   -- disables inline completion for use with cmp
	-- disable_keymaps = true              -- disables built in keymaps for more manual control
})
