    set autoread " detect when a file is changed

    " WARNING: These settings disable vim's backups (swap files).
    " If this is not desired, comment these lines out.
    set nobackup " don't use backup files
    set nowritebackup " don't backup the file while editing
    set noswapfile " Don't create swapfiles for new buffers
    set updatecount=0 " don't try to write swap files after some number of updates
	

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " change where swap files are stored"
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

	set history=1000 "store the last 1000 command-lines entered

    set termguicolors   

    if (has('nvim'))
        " show results of substition as they're happening
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed,unnamedplus

    if has('mouse')
        set mouse=a
    endif

    "lets try and get good at searching to jump to line
		set relativenumber
		set number
		set number relativenumber

		set cursorline

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500

		set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing h
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    " set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=2 " command bar height
    " set title  "set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=300
    set signcolumn=yes
    set shortmess-=S " Show [X/X] search results
		set ttimeoutlen=300
		" set autochdir	

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=2 " the visible width of tabs
    set softtabstop=2 " edit as if the tabs are 4 characters wide
    set shiftwidth=2 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'


    set textwidth=120
		set colorcolumn=100
    "set co=120

		set wildignore+=node_modules/**
		set wildignore+=.git/**

set laststatus=3
highlight WinSeparator guibg=none guifg=#4B5B8B

