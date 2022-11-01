call plug#begin('~/.config/nvim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'


Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/vim-be-good'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'ThePrimeagen/vim-apm'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'tpope/vim-fugitive'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'mattn/emmet-vim'

Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'leafOfTree/vim-svelte-plugin'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-zh/colorful-winsep.nvim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'


"debugging
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
"
" LUA CODE
" luasnip
lua require("init")

" COLOR
" colorscheme dracula
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

" highlight Normal guibg=none ctermbg=none
" hi EndOfBuffer guibg=NONE ctermbg=NONE
let g:vim_svelte_plugin_load_full_syntax = 1

" highlight LineNr guifg=#836EAE
" highlight CursorLineNr guifg=#2CC3DF

highlight Comment gui=bold 

let mapleader = " " 
set mouse=a

" source ~/.config/nvim/parts/maps.vim
" source ~/.config/nvim/parts/sets.vim

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
let g:user_emmet_install_global = 1
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


" imap <silent><script><expr> <C-o> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

autocmd FileType javascript hi DraculaCyanItalic gui=bold

set clipboard=unnamed,unnamedplus


let g:vim_be_good_log_file = 1
let g:vim_be_good_save_statistics = 1
