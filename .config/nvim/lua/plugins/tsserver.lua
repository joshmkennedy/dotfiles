return {
	"pmizio/typescript-tools.nvim",
	enabled = true,
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		print("Loading typescript-tools")
		require("typescript-tools").setup({
			on_attach = require("lsp.attach"),
			settings = {
				separate_diagnostic_server = false,
				-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
				-- not exists then standard path resolution strategy is applied
				-- set this to be the project root tsserverjs file installed in node_modules
				-- tsserver_path = vim.fn.getcwd() .. "/node_modules/typescript/lib/tsserver.js",
				completeFunctionCalls = true,
				expose_as_code_action = "all",
				javascript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = false,
					},
				},

				typescript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = false,
					},
				},

			}
		})
	end
}
