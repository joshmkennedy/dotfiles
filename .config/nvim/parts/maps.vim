
let mapleader=" " 
noremap , :set hlsearch! hlsearch?<cr>
nmap <leader>w :w<cr>
inoremap jj <esc>
" delete characters but dont save to register
nmap <leader>x "_x

" Flip the lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>] :cn<CR>
nnoremap <leader>[ :cp<CR>

" TODO move to its own customization
nnoremap <leader>ff :Telescope find_files prompt_prefix=🔍<CR>
nnoremap <leader>gg :Telescope live_grep prompt_prefix=🦖<CR>

function! TelescopeLspRef() 
    lua vim.lsp.buf.references();

endfunction
" Highlights a function
nnoremap <leader>hf Vf{%


 
