return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "never",
		},
		formatters_by_ft = {
			blade = { "blade-formatter" },
			-- php = {"pretty-php"}
			ocaml = { "ocamlformat" },
			-- sql
			sql = { "sleek" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		},
		formatters = {
			prettier = {
				require_cwd = true,
				cwd = function(_, ctx)
					return vim.fs.root(ctx.filename, {
						".prettierrc",
						".prettierrc.json",
						".prettierrc.js",
						"prettier.config.js",
						"package.json",
					})
				end,
			},
			prettierd = {
				require_cwd = true,
				cwd = function(_, ctx)
					return vim.fs.root(ctx.filename, {
						".prettierrc",
						".prettierrc.json",
						".prettierrc.js",
						"prettier.config.js",
						"package.json",
					})
				end,
			},
			ocamlformat = {
				prepend_args = {
					"--if-then-else",
					"vertical",
					"--break-cases",
					"fit-or-vertical",
					"--type-decl",
					"sparse",
				},
			},
			--slq

		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.api.nvim_create_user_command('Fd', function()
			require("conform").format({ async = true, lsp_format = "never" })
		end, {})
	end
}
