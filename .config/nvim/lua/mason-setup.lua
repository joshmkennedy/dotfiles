require("mason").setup()
require("mason-lspconfig").setup()

local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup(require("lsp.ts"))
nvim_lsp.gopls.setup(require("lsp.go"))
nvim_lsp.intelephense.setup(require("lsp.php"))
-- nvim_lsp.psalm.setup({})
-- nvim_lsp.phpactor.setup({}) // needs to be setup with stubs to be useful. Doesnt find things like intelephense
nvim_lsp.cssls.setup(require("lsp.css"))
nvim_lsp.tailwindcss.setup(require("lsp.tailwind"))
nvim_lsp.svelte.setup({})
nvim_lsp.rust_analyzer.setup(require("lsp.rust"))
nvim_lsp.diagnosticls.setup(require("lsp.diagnotics"))
nvim_lsp.sumneko_lua.setup({})
