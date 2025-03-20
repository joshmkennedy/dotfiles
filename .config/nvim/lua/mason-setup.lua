require("fidget").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require 'neodev'.setup()
local on_attach = require("lsp.attached")
local nvim_lsp = require("lspconfig")

-- nvim_lsp.ts_ls.setup(require("lsp.ts"))
require'typescript-tools'.setup(require'lsp.ts')


nvim_lsp.diagnosticls.setup(require("lsp.diagnotics"))
nvim_lsp.html.setup({ on_attach = on_attach })
nvim_lsp.svelte.setup(require("lsp.svelte"))
nvim_lsp.cssls.setup(require("lsp.css"))
nvim_lsp.tailwindcss.setup(require("lsp.tailwind"))
nvim_lsp.astro.setup({
	on_attach = on_attach,
})

nvim_lsp.gopls.setup(require("lsp.go"))

-- nvim_lsp.psalm.setup({on_attach = on_attach })

-- MORE TROUBLE THAN ITS WORTH
-- nvim_lsp.phpactor.setup({
-- 	on_attach = on_attach,
-- 	init_options = {
-- 		["language_server_phpstan.enabled"] = false,
-- 		["language_server_psalm.enabled"] = false,
-- 	},
-- })

nvim_lsp.intelephense.setup(require("lsp.php"))


nvim_lsp.lua_ls.setup(require "lsp.lua")

nvim_lsp.rust_analyzer.setup(require("lsp.rust"))

nvim_lsp.ocamllsp.setup({ on_attach = on_attach })

nvim_lsp.clangd.setup({})

nvim_lsp.jsonls.setup({ on_attach = on_attach })

nvim_lsp.zls.setup({ on_attach = on_attach })

nvim_lsp.rescriptls.setup({ on_attach = on_attach })
