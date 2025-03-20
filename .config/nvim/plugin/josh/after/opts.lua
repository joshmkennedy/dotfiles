vim.opt.autoread=true -- detect when a file is changed

-- WARNING: These settings disable vim's backups (swap files).
-- adfasd
-- If this is not desired, comment these lines out.
-- vim.opt.backup = true -- don't use backup files
-- vim.opt.nowritebackup = true -- don't backup the file while editing
-- vim.opt.noswapfile = true -- Don't create swapfiles for new buffers
vim.opt.updatecount=0 -- don't try to write swap files after some number of updates


vim.opt.backupdir= "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp" -- change where swap files are stored--
vim.opt.directory= "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"

vim.opt.history=1000 --store the last 1000 command-lines entered

vim.opt.termguicolors = true


vim.opt.backspace="indent,eol,start" -- make backspace behave in a sane manner
vim.opt.clipboard="unnamed,unnamedplus"

--lets try and get good at searching to jump to line
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.cursorline = true

-- Searching
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- vim.opt.incremental search, like modern browsers
vim.opt.lazyredraw = false -- don't redraw while executing macros

vim.opt.magic  = true -- vim.opt.magic on, for regex

-- error bells
vim.opt.errorbells = false
vim.opt.visualbell = true
-- vim.opt.t_vb=
vim.opt.tm=500

vim.opt.autoindent = true -- automatically vim.opt.indent of new line
vim.opt.ttyfast = true -- faster redrawing h
vim.opt.diffopt:append("vertical,iwhite,internal,algorithm:patience,hiddenoff")
vim.opt.so=7 -- vim.opt.7 lines to the cursors - when moving vertical
vim.opt.wildmenu = true -- enhanced command line completion
-- vim.opt.hidden -- current buffer can be put into background
vim.opt.showcmd = true -- show incomplete commands
vim.opt.showmode = false -- don't show which mode disabled for PowerLine
vim.opt.wildmode="list:longest" -- complete files like a shell
vim.api.nvim_exec("set shell=$SHELL", true)	
vim.opt.cmdheight=2 -- command bar height
-- vim.opt.title  --vim.opt.terminal title
vim.opt.showmatch = true -- show matching braces"
vim.opt.mat=2 -- how many tenths of a second to blink
vim.opt.updatetime=300
vim.opt.signcolumn="yes"
vim.opt.shortmess:remove("S") -- Show [X/X] search results
vim.opt.ttimeoutlen=300

-- Tab control
vim.opt.smarttab = true  -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop=2 -- the visible width of tabs
vim.opt.softtabstop=2 -- edit as if the tabs are 4 characters wide
vim.opt.shiftwidth=2 -- number of spaces to use for indent and unindent
vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

vim.opt.textwidth=120
vim.opt.colorcolumn="100"
--vim.opt.co=120

vim.opt.wildignore:append("node_modules/**")
vim.opt.wildignore:append(".git/**")

-- highlight WinSeparator guibg=none guifg=#4B5B8B

-- Default splitting will cause your main splits to jump when opening an edgebar.
-- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = "screen"

vim.opt.autoread=true -- detect when a file is changed

-- WARNING: These settings disable vim's backups (swap files).
-- adfasd
-- If this is not desired, comment these lines out.
-- vim.opt.backup = true -- don't use backup files
-- vim.opt.nowritebackup = true -- don't backup the file while editing
-- vim.opt.noswapfile = true -- Don't create swapfiles for new buffers
vim.opt.updatecount=0 -- don't try to write swap files after some number of updates


vim.opt.backupdir= "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp" -- change where swap files are stored--                                                                        vim.opt.directory= "~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp"

vim.opt.history=1000 --store the last 1000 command-lines entered


-- if (has('nvim'))
--              -- show results of substition as they're happening
--              vim.opt.inccommand=nosplit
-- endif

vim.opt.backspace="indent,eol,start" -- make backspace behave in a sane manner
vim.opt.clipboard="unnamed,unnamedplus"

-- if has('mouse')
--              vim.opt.mouse=a
-- endif

--lets try and get good at searching to jump to line
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- vim.opt.incremental search, like modern browsers
vim.opt.lazyredraw = false -- don't redraw while executing macros

vim.opt.magic  = true -- vim.opt.magic on, for regex

-- error bells
vim.opt.errorbells = false
vim.opt.visualbell = true
-- vim.opt.t_vb=
vim.opt.tm=500

vim.opt.autoindent = true -- automatically vim.opt.indent of new line
vim.opt.ttyfast = true -- faster redrawing h
vim.opt.diffopt:append("vertical,iwhite,internal,algorithm:patience,hiddenoff")
vim.opt.so=7 -- vim.opt.7 lines to the cursors - when moving vertical
vim.opt.wildmenu = true -- enhanced command line completion
-- vim.opt.hidden -- current buffer can be put into background
vim.opt.showcmd = true -- show incomplete commands
vim.opt.showmode = false -- don't show which mode disabled for PowerLine
vim.opt.wildmode="list:longest" -- complete files like a shell
vim.api.nvim_exec("set shell=$SHELL", true)
vim.opt.cmdheight=2 -- command bar height
-- vim.opt.title  --vim.opt.terminal title
vim.opt.showmatch = true -- show matching braces"
vim.opt.mat=2 -- how many tenths of a second to blink
vim.opt.updatetime=300
vim.opt.signcolumn="yes"
vim.opt.shortmess:remove("S") -- Show [X/X] search results
vim.opt.ttimeoutlen=300


vim.opt.showcmd = true -- show incomplete commands
vim.opt.showmode = false -- don't show which mode disabled for PowerLine
vim.opt.wildmode="list:longest" -- complete files like a shell
-- vim.api.nvim_exec("set shell=$SHELL", true)
vim.opt.cmdheight=2 -- command bar height
-- vim.opt.title  --vim.opt.terminal title
vim.opt.showmatch = true -- show matching braces"
vim.opt.mat=2 -- how many tenths of a second to blink
vim.opt.updatetime=300
vim.opt.signcolumn="yes"
vim.opt.shortmess:remove("S") -- Show [X/X] search results
vim.opt.ttimeoutlen=300
-- vim.opt.autochdir

-- Tab control
vim.opt.smarttab = true  -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop=2 -- the visible width of tabs
vim.opt.softtabstop=2 -- edit as if the tabs are 4 characters wide
vim.opt.shiftwidth=2 -- number of spaces to use for indent and unindent
vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'


vim.opt.textwidth=120
vim.opt.colorcolumn="100"
--vim.opt.co=120

vim.opt.wildignore:append("node_modules/**")
vim.opt.wildignore:append(".git/**")


--Status line and winbar options

vim.cmd[[highlight WinSeparator guibg=none guifg=#4B5B8B]]
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 		callback = function()
-- 			if vim.bo.filetype == "" then
-- 				return
-- 			end
-- 			vim.wo.winbar = "%=%m%f"
-- 		end
-- 	})

