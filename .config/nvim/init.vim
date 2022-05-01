call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'

Plug 'rust-lang/rust.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'ThePrimeagen/vim-be-good'

Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'

Plug 'ThePrimeagen/harpoon'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


Plug 'mattn/emmet-vim'

Plug 'sheerun/vim-polyglot'

Plug 'github/copilot.vim'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
"
" LUA CODE
lua require('init')



" COLOR
colorscheme dracula

highlight Normal guibg=none
highlight LineNr guifg= #8898DB
highlight CursorLineNr  guifg=#50FA7B

highlight Comment gui=bold 
" guifg=#6F7FBC

let mapleader = " " 

source ~/.config/nvim/parts/maps.vim
source ~/.config/nvim/parts/sets.vim

source ~/projects/vim4ever/vim-plugin/plugin/vim-forever.vim

let &runtimepath.=',' . expand("$HOME") . '/projects/stylasis'

" Luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"}}}

" emit

let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,jsx,svelte,php,twig EmmetInstall
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
  \ 'twig' : {
  \   'extends':'html',
  \ }
  \}

augroup highlight_yank 
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" suggest plugin



autocmd FileType javascript hi DraculaCyanItalic gui=bold

