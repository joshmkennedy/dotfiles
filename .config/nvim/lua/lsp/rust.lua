
local function config(_config)
    return vim.tbl_deep_extend("force", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        }, _config or {})
end 

return config()
