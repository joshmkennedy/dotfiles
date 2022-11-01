local nvim_lsp = require("lspconfig")

require("nvim-lsp-installer").setup()

require("nvim-treesitter.configs").setup {  -- 
    highlight = {
         enable = true,
        disable = {"css","scss", "html","php" },
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true, },
    indentation = {
        enable = true,
        -- disable = {"php"}
    }
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
    vim.cmd("command! LspLocationList lua vim.diagnostic.setloclist()")
    vim.cmd( "command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

		vim.keymap.set("n", "gd", ":LspDef<CR>", {silent = true})
    vim.keymap.set("n", "gr", ":LspRename<CR>", {silent = true})

    -- This finds all references of var or func and stores them in quickfixlist
    vim.keymap.set( "n", "gR", ":LspRefs<CR>", {silent = true})
    vim.keymap.set( "n", "gy", ":LspTypeDef<CR>", {silent = true})
    vim.keymap.set( "n", "K", ":LspHover<CR>", {silent = true})
    vim.keymap.set( "n", "gs", ":LspOrganize<CR>", {silent = true})
    vim.keymap.set( "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    vim.keymap.set( "n", "]a", ":LspDiagNext<CR>", {silent = true})
    vim.keymap.set( "n", "ga", ":LspCodeAction<CR>", {silent = true})
    vim.keymap.set( "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    vim.keymap.set( "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})

if client.server_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end
	
-- TYPSCRIPT
nvim_lsp.tsserver.setup {
		filetypes = {'typescript','javascript','javascriptreact', 'typescriptreact'},
    on_attach = function(client)
        client.server_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- GO
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

-- PHP
nvim_lsp.intelephense.setup{
    settings = {
        intelephense = {
            stubs = { "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "fileinfo",
                "filter",
                "ftp",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "recode",
                "Reflection",
                "regex",
                "session",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "standard",
                "superglobals",
                "sysvsem",
                "sysvshm",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "acf-stubs",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang",
                "sbi"},
            diagnostics = {enable = true},
            files = {
                maxSize = 10000000;
            };
            
        };
    }
}



-- CSS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach
}

nvim_lsp.tailwindcss.setup{
    on_attach = on_attach,
}

nvim_lsp.svelte.setup{}

-- RUST
local function config(_config)
    return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}, _config or {})
end 
nvim_lsp.rust_analyzer.setup(config())
-- DIAGNOSTICLS
nvim_lsp.diagnosticls.setup {
	on_attach = on_attach,
	filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact','svelte', 'css', 'less', 'scss', 'markdown', 'pandoc' },
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
			},
		},
		formatFiletypes = {
			css = 'prettier',
			javascript = 'prettier',
			javascriptreact = 'prettier',
			json = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			typescript = 'prettier',
			typescriptreact = 'prettier',
			json = 'prettier',
			markdown = 'prettier',
      svelte = 'prettier',
		}
	}
}


local cmp = require"cmp"
-- cmp stuff
local lspkind = require"lspkind"
lspkind.init()
-- Setup nvim-cmp.
cmp.setup({

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-x>"] = cmp.mapping.close(),

        ["<c-y>"] = cmp.mapping.confirm {
                behavior= cmp.ConfirmBehavior.Insert,
                select=true,
               
        },
        ["<c-space>"] = cmp.mapping.complete(),

	  },
    sources = {
      { name = 'css_vars', priority = 100, },
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'path' },
      { name = 'buffer' },
    },

    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                path = "[PATH]",
                luasnip = "[SNIP]",
                cmdline = "[CMD]",
                css_vars = "[CSS]",
            },
        },
    },
    experimental = {
        -- ghost_text = true,
       native_menu=false, 
    },
    
  })

  cmp.setup.cmdline('/', {

    sources = {
      { name = 'buffer' }
    }
  }) 

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {

      { name = 'cmdline' }
    
    }),

  })


vim.keymap.set({'i','c'}, '<C-n>', function()
    cmp.select_next_item()
end)
vim.keymap.set({'i','c'}, '<C-p>', function()
    cmp.select_prev_item()
end)


