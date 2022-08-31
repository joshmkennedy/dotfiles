require'globals'
require'custom-cmp-sources.cmp_css_vars'
require'lsp'
require'setup-telescope'
require'lualine-setup'
require'setup-comments'
require'mydap'


-- MY CSS STYLASIS PLUGIN 
require'stylasis-setup'


require'luaSnippets'
require'snippets.php';


-- vim.opt.list = true

require("indent_blankline").setup {
    show_end_of_line = true,
}
