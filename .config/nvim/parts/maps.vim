
let mapleader=" " 
noremap , :set hlsearch! hlsearch?<cr>
nmap <leader>w :w<cr>
inoremap jj <esc>
" delete characters but dont save to register
nmap <leader>x "_x

" Flip the lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>

" TODO move to its own customization
nnoremap <leader>ff :Telescope find_files<CR> 
nnoremap <leader>gg :Telescope live_grep<CR> 

 
