
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute


let mapleader = " " 
" SETS

let g:plugs_disabled = ["tigris.nvim","node-host","yajs.vim", 'es.next.syntax.vim', 'vim-node'  ]
function! Plug_disable()
  for name in g:plugs_disabled
    if has_key(g:plugs, name)
      call remove(g:plugs, name)
    endif

    let idx = index(g:plugs_order, name)
    if idx > -1
      call remove(g:plugs_order, idx)
    endif
  endfor
endfunction
call plug#begin('~/.config/nvim/plugged')
	" Plugil
	source ~/.config/nvim/parts/plugin.vim		
	call Plug_disable()
call plug#end()

function! SetMDXForMD()
	if expand('%:e') == 'mdx'
		set filetype=markdown
	endif	
endfunction

autocmd BufReadPre,FileReadPre * call SetMDXForMD()

" MAPS

colorscheme dracula
highlight Normal guibg=none


" highlight LineNr guifg=darkGrey
highlight CursorLineNr  guifg=#50FA7B

if executable("deno")
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "deno lsp",
    \ "cmd": {server_info -> ["deno", "lsp"]},
    \ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
    \ "allowlist": ["typescript", "typescript.tsx"],
    \ "initialization_options": {
    \     "enable": v:true,
    \     "lint": v:true,
    \     "unstable": v:true,
    \   },
    \ })
  augroup END
endif


function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

source ~/.config/nvim/parts/statusline.vim


set runtimepath^=~/.config/nvim/plugin/nvim-whid
set runtimepath^=~/.config/nvim/plugin/nvim-stdout-buf

syn keyword javaScriptIdentifier	arguments this var that self


nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

source ~/.config/nvim/parts/sets.vim
source ~/.config/nvim/parts/maps.vim


" SNIPPETS

lua require('init')
lua ls = require('luasnip')

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
