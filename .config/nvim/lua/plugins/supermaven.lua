return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-h>"
			},
			ignore_filetypes = {
				TelescopePrompt = true,
				["neo-tree"] = true,
				none = true,
			},
		})
	end,
}
