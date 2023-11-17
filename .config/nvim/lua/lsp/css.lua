local on_attach = require("lsp.attached")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
				-- unknownRules = "ignore",
			},
		},
		svelte = {
			validate = false
		}
	},
}

