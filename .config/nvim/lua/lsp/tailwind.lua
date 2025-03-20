local nvim_lsp = require("lspconfig")
local on_attach = require("lsp.attached")

return {
    on_attach = on_attach,
    filetypes=vim.tbl_deep_extend("force",nvim_lsp.tailwindcss.document_config.default_config.filetypes, {"html.twig"}),
    settings={
        tailwindCss = {
            includeLanguages={
                ['html.twig']='twig',
            }
        }
    }
}

