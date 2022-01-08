Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'StanAngeloff/php.vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
let g:vim_jsx_pretty_highlight_close_tag = 1

Plug 'tpope/vim-surround'

" Other Plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'ncm2/ncm2'
Plug 'phpactor/phpactor'
Plug 'phpactor/ncm2-phpactor'
Plug 'rust-lang/rust.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'


Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'stephenway/postcss.vim', { 'for': 'css' }

Plug 'tpope/vim-markdown', { 'for': 'markdown' }
let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

Plug 'ekalinin/Dockerfile.vim'
Plug 'jparise/vim-graphql'

Plug 'sheerun/vim-polyglot' " CSS 

Plug 'ThePrimeagen/vim-be-good'
source ~/.config/nvim/parts/customizations/coc.vim

Plug 'tpope/vim-fugitive'
source ~/.config/nvim/parts/customizations/fugitive.vim

Plug 'ThePrimeagen/harpoon'
source ~/.config/nvim/parts/customizations/harpoon.vim

Plug 'L3MON4D3/LuaSnip'
