return {
	on_attach = require'lsp.attached',
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file('',true),
				checkThirdParty = false,
			}
		}
	}
}
