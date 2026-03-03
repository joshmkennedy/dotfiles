vim.lsp.enable("json-lsp")
vim.lsp.enable("biome")
vim.lsp.enable("css_variables")
vim.lsp.enable("cssls")
vim.lsp.enable("diagnosticls")
vim.lsp.enable("html")
vim.lsp.enable("lua_ls")

vim.lsp.enable("eslint")



-- vim.lsp.enable("emmet-ls")
-- vim.lsp.enable("goimports")
vim.lsp.enable("gopls")
vim.lsp.enable("html-lsp")
vim.lsp.enable("intelephense")
-- vim.lsp.enable("js-debug-adapter")
-- vim.lsp.enable("lua-language-server")
-- vim.lsp.enable("markdownlint")
-- vim.lsp.enable("node-debug2-adapter")
vim.lsp.enable("phpstan")
-- vim.lsp.enable("prettier")
-- vim.lsp.enable("prisma-language-server")
vim.lsp.enable("svelte")


vim.lsp.enable("tailwindcss")

-- vim.lsp.enable("ocaml")
vim.lsp.enable("elixir-ls")

-- vim.lsp.enable("tsserver")

-- vim.lsp.config("tsgo", {
-- 	cmd = { "tsgo", "--lsp", "--stdio" },
-- 	on_attach = require("lsp.attach"),
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
-- 	root_markers = {
-- 		".git",
-- 		"tsconfig.json",
-- 		"package.json",
-- 		"node_modules",
-- 		"tsconfig.base.json",
-- 	},
-- })
--
vim.lsp.config("sqls", { on_attach = require("lsp.attach"), cmd = { "sqls" } })
vim.lsp.config("sqlfmt", { on_attach = require("lsp.attach") })

vim.lsp.config("typescript-tools", require "lsp.ts")


vim.lsp.config("jsonlint", { on_attach = require("lsp.attach") })



local mason_registry = require("mason-registry")
local vue_language_server = "Users/joshkennedy/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/"

vim.lsp.config.vtsls = {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "vue", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = {
    "tsconfig.json", "package.json", "jsconfig.json", ".git"
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server,
            languages = { 'vue' },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          }
        }
      }
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
    }
  },
}
vim.lsp.enable("vts_ls", true)
