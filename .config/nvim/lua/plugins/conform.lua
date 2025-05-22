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
		},
	},
	config = function()
		vim.api.nvim_create_user_command('Fd', function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, {})
	end
}
