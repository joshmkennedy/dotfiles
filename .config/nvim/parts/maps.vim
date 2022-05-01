
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

" Highlights a function
nnoremap <leader>hf Vf{%
" Netrw
nnoremap <leader>e :Ex<CR>

imap <silent><script><expr> <C-O> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

map <leader>r :so %<CR>

"
" EMMET
imap <C-a> <C-y>, 

" VIM4EVER
nmap <leader><leader>4 :ToggleVimForeverStart<CR>
