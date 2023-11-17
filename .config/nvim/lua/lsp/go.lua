local on_attach = require("lsp.attached")
return {
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
