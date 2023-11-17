local on_attach = require('lsp.attached')
local function config()
    return {
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_attach = on_attach
        }
end

return config()
