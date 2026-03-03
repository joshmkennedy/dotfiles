vim.go.laststatus = 3

vim.diagnostic.config({
  highlight = {
    enable = true,
    virtual_text = true,
  },
  virtual_text = {
    prefix = '●',
  },
})

vim.api.nvim_create_user_command("LspHover", function()
  vim.lsp.buf.hover({
    border = "rounded",
    max_height = 20,
    max_width = 130,
  })
end, {
  range = true,
})

vim.keymap.set("n", "K", ":LspHover<CR>", { silent = true, noremap = true })
