
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	 

	use { 'catppuccin/nvim' , as='catppuccin'}
	use "morhetz/gruvbox"
	use "folke/tokyonight.nvim"

	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'

	use 'christoomey/vim-tmux-navigator'

	use "klen/nvim-config-local" -- [ ]

	--UTIL
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'

	use 'glepnir/dashboard-nvim'
	use 'numToStr/Comment.nvim'  -- [ ]
	use 'lukas-reineke/indent-blankline.nvim'
	use 'Vonr/align.nvim'

	use 'nvim-lualine/lualine.nvim'
	use { 'joshmkennedy/winbar.nvim' }
	--
	--NAVIGATION of files
	use 'ThePrimeagen/harpoon' -- [ ]
	use 'ThePrimeagen/vim-be-good'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'


	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/playground'

	-- LSP
	use { "williamboman/mason.nvim" }
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use 'jose-elias-alvarez/null-ls.nvim'

	--DEBUGGING
	use 'mfussenegger/nvim-dap'
	use 'leoluz/nvim-dap-go'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'

	--AUTOCOMPLETE
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'onsails/lspkind-nvim'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- AI SUGGESTS
	-- use {
	-- 	'Exafunction/codeium.vim',
	-- 	config = function ()
	-- 		vim.keymap.set('i', '<C-o>', function ()
	-- 			return vim.fn['codeium#Accept']()
	-- 		end, { expr = true })
	-- 	end
	-- }
-- END AUTOCOMPLETE

	--SNIPPETS
	use 'mattn/emmet-vim' -- [ ]
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	use 'tpope/vim-fugitive' -- [ ] 
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
	}

	-- File Syntax Highlight
	use 'sheerun/vim-polyglot'

	-- FONTS
	use 'ryanoasis/vim-devicons'
	use 'nvim-tree/nvim-web-devicons'

	use {
		"jcdickinson/wpm.nvim"	,
		config = function ()
			require('wpm').setup({})
		end
	}
	use 'voldikss/vim-floaterm'
 -- MY PLUGINS
 use "~/.config/nvim/myplugins/wp-cli-nvim"

end )
