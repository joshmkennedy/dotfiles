return{
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("typescript-tools").setup(require "lsp.ts")
	end
}
