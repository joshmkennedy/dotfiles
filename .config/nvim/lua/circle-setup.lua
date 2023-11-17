-- require("circles").setup({
-- 	icons = { empty = "", filled = "", lsp_prefix = "" },
--   lsp = true
-- 	
-- })
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})
