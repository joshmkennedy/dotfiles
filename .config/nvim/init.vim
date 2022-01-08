call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'rust-lang/rust.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'ThePrimeagen/vim-be-good'

Plug 'tpope/vim-fugitive'

Plug 'ThePrimeagen/harpoon'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


Plug 'mattn/emmet-vim'
Plug 'chrisbra/vim-commentary'

Plug 'sheerun/vim-polyglot'

Plug 'github/copilot.vim'

call plug#end()
"
" LUA CODE
lua require('init')

set completeopt=menu,menuone,noselect  "for nvim-cmp

" COLOR
colorscheme dracula
highlight Normal guibg=none
highlight CursorLineNr  guifg=#50FA7B

let mapleader = " " 

source ~/.config/nvim/parts/maps.vim

source ~/.config/nvim/parts/sets.vim

source ~/sites/joshs/vim-forever/vim-plugin/plugin/vim-forever.vim
set runtimepath^=~/sites/joshs/vim-forever/vim-plugin

" Luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"}}}

" emit
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,jsx EmmetInstall
let g:user_emmet_settings = {
  \  'svelte' : {
  \    'extends' : 'html',
  \  },
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
  \  },
  \  'javascript' : {
  \    'extends' : 'jsx',
  \  },
  \  'js' : {
  \    'extends' : 'jsx',
  \  },
  \  'jsx' : {
  \    'extends' : 'html',
  \  },
  \}

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" copilot
imap <silent><script><expr> <C-Y> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
