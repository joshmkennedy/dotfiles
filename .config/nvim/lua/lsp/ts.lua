local on_attach = require("lsp.attached")
return {
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
	init_options = {
		hostInfo = "neovim",
		logVerbosity = "verbose",
	},
	on_attach = function(client)
		client.server_capabilities.document_formatting = true
		on_attach(client)
	end
}
