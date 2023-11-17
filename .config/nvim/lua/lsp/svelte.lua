local on_attach = require("lsp.attached")
return {
	on_attach = function(client)
		client.server_capabilities.document_formatting = true
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
			end,
		})
		on_attach(client)
	end,
}
