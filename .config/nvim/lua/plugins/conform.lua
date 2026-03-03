return {
	"stevearc/conform.nvim",
	opt = {
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			blade = { "blade-formatter" },
			-- php = {"pretty-php"}
			ocaml = { "ocamlformat" },
			-- sql
			sql = { "sleek" },
			-- typescript
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
				 args = { "--stdin-from-filename", "$FILENAME", "--config", "${workspaceFolder}/.prettierrc" }
			},
		},
		formatters = {
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
	config = function()
		vim.api.nvim_create_user_command('Fd', function()
			-- vim.lsp.buf.format()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, {})
	end
}
