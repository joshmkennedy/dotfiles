local navbuddy = require("nvim-navbuddy")


return function(client, bufnr)
	local buf_map = vim.api.nvim_buf_set_keymap
	vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspOrganize lua lsp_organize_imports()")
	vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
	vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
	vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
	vim.cmd("command! LspLocationList lua vim.diagnostic.setloclist()")
	vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

	vim.api.nvim_create_user_command("LspRename", function()
		vim.lsp.buf.rename(nil, {
			filter = function(_client) return _client.name ~= "phpactor" end
		})
	end, {})

	-- This finds all references of var or func and stores them in quickfixlist
	vim.keymap.set("n", "gd", ":LspDef<CR>", { silent = true })
	vim.keymap.set("n", "gn", ":LspRename<CR>", { silent = true })
	vim.keymap.set("n", "gr", ":LspRefs<CR>", { silent = true })
	vim.keymap.set("n", "<leader>gt", ":LspTypeDef<CR>", { silent = true })
	vim.keymap.set("n", "K", ":LspHover<CR>", { silent = true })
	--vim.keymap.set( "n", "gs", ":LspOrganize<CR>", {silent = true})
	vim.keymap.set("n", "[a", ":LspDiagPrev<CR>", { silent = true })
	vim.keymap.set("n", "]a", ":LspDiagNext<CR>", { silent = true })
	vim.keymap.set("n", "ga", ":LspCodeAction<CR>", { silent = true })
	vim.keymap.set("n", "<Leader>a", ":LspDiagLine<CR>", { silent = true })
	vim.keymap.set("i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", { silent = true })

	vim.keymap.set("n", "<Leader>!", "<cmd>LspRestart<CR><cmd>e!<CR>", {})


	vim.api.nvim_create_user_command("ToggleInlayHints", function()
		if vim.lsp.inlay_hint then
			if vim.lsp.inlay_hint.is_enabled() then
				vim.lsp.inlay_hint.enable(false)
			else
				vim.lsp.inlay_hint.enable(true)
			end
		else
			P("inlay_hint not available")
		end
	end, { nargs = 0 })

	-- NAV BUDDY
	-- if client.server_capabilities.documentSymbolProvider then
		-- navbuddy.attach(client, bufnr)
	-- end
end
