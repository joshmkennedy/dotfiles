local nvim_lsp = require("lspconfig")

require("nvim-treesitter.configs").setup {  
    highlight = { 
         enable = true,
        disable = {"css","scss"},
    }, 
    incremental_selection = { enable = true }, 
    textobjects = { enable = true }
}


local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async
_G.lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd(
        "command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
		buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",
              {silent = true})
if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end
	
nvim_lsp.tsserver.setup {
		filetypes = {'typescript','javascript','typescriptreact', 'typescriptreact'},
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

nvim_lsp.gopls.setup {

	cmd = {'gopls'},
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedParams = true,
				shadow = true,

			},
			staticcheck = true,

		},
	},
	on_attach = on_attach 
}
-- nvim_lsp.denols.setup{}
nvim_lsp.intelephense.setup{}

--CSS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.cssls.setup{
  capabilities = capabilities,
}

nvim_lsp.diagnosticls.setup {
	on_attach = on_attach,
	filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
	init_options = {
		linters = {
			eslint = {
				command = 'eslint_d',
				rootPatterns = { '.git' },
				debounce = 100,
				args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
				sourceName = 'eslint_d',
				parseJson = {
					errorsRoot = '[0].messages',
					line = 'line',
					column = 'column',
					endLine = 'endLine',
					endColumn = 'endColumn',
					message = '[eslint] ${message} [${ruleId}]',
					security = 'severity'
				},
				securities = {
					[2] = 'error',
					[1] = 'warning'
				}
			},
		},
		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			typescriptreact = 'eslint',
		},
		formatters = {
			eslint_d = {
				command = 'eslint_d',
				args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
				rootPatterns = { '.git' },
			},
			prettier = {
				command = 'prettier',
				args = { '--stdin-filepath', '%filename' }
			}
		},
		formatFiletypes = {
			css = 'prettier',
			javascript = 'prettier',
			javascriptreact = 'eslint_d',
			json = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			typescript = 'eslint_d',
			typescriptreact = 'prettier',
			json = 'prettier',
			markdown = 'prettier',
		}
	}
}

-- cmp stuff
-- Setup nvim-cmp.
local cmp = require"cmp"

cmp.setup({

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
	},
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
    }
    
  }) 
