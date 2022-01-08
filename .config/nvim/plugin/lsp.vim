set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>


let g:cmp = {}
let g:cmp.enabled = v:true
let g:cmp.autocomplete = v:true
let g:cmp.debug = v:false
let g:cmp.min_length = 1
let g:cmp.preselect = 'enable'
let g:cmp.throttle_time = 80
let g:cmp.source_timeout = 200
let g:cmp.incomplete_delay = 400
let g:cmp.max_abbr_width = 100
let g:cmp.max_kind_width = 100
let g:cmp.max_menu_width = 100
let g:cmp.documentation = v:true

let g:cmp.source = {}
let g:cmp.source.path = v:true
let g:cmp.source.buffer = v:true
let g:cmp.source.calc = v:true
let g:cmp.source.nvim_lsp = v:true
let g:cmp.source.nvim_lua = v:true
let g:cmp.source.vsnip = v:true
let g:cmp.source.ultisnips = v:true
let g:cmp.source.luasnip = v:true


