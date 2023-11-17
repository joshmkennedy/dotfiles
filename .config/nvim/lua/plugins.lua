return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use("morhetz/gruvbox")
	use("folke/tokyonight.nvim")
	use "rebelot/kanagawa.nvim"
	use 'Mofiqul/dracula.nvim'

	use({ "tjdevries/colorbuddy.nvim" })

	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	use("christoomey/vim-tmux-navigator")

	use("klen/nvim-config-local") -- [ ]

	--UTIL
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	use("glepnir/dashboard-nvim")
	use({ "lukas-reineke/indent-blankline.nvim", disable = false })
	use({ "folke/edgy.nvim" })

	use("numToStr/Comment.nvim") -- [ ]
	use("Vonr/align.nvim")

	use("nvim-lualine/lualine.nvim")

	--NAVIGATION of files
	use("ThePrimeagen/harpoon") -- [ ]
	use("ThePrimeagen/vim-be-good")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
		config = function()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			-- NOTE: this is changed from v1.x, which used the old style of highlight groups
			-- in the form "LspDiagnosticsSignWarning"


			vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
		end,
	})

	use "folke/flash.nvim"

	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup({
			winbar = {
				enabled = false,
			},
		})
	end }

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	use({
		'Wansmer/treesj',
		requires = { 'nvim-treesitter' },
		config = function()
			require('treesj').setup({ --[[ your config ]] })
		end,
	})
	-- LSP
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use("ThePrimeagen/refactoring.nvim")

	use({ "folke/neodev.nvim" })

	use({ "folke/trouble.nvim", })
	use({ "projekt0n/circles.nvim" })

	--DEBUGGING
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")


	--AUTOCOMPLETE
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- AI SUGGESTS
	use {
		'Exafunction/codeium.vim',
		config = function()
			vim.keymap.set('i', '<C-o>', function()
				return vim.fn['codeium#Accept']()
			end, { expr = true, silent = true })
		end
	}

	-- END AUTOCOMPLETE
	--

	--SNIPPETS
	use("mattn/emmet-vim") -- [ ]
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("mbbill/undotree")

	use("tpope/vim-fugitive") -- [ ]
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- File Syntax Highlight
	use({
		"sheerun/vim-polyglot",
		disable = true,
	})
	use({
		"StanAngeloff/php.vim",
	})
	use 'nkrkv/nvim-treesitter-rescript'
	use 'rescript-lang/vim-rescript'

	-- FONTS
	use("ryanoasis/vim-devicons")
	use("nvim-tree/nvim-web-devicons")

	use("voldikss/vim-floaterm")
	use("norcalli/nvim-colorizer.lua")

	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")

	use("rcarriga/nvim-notify")
	use("folke/noice.nvim", {
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true,    -- use a classic bottom cmdline for search
					command_palette = true,  -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false,      -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false,  -- add a border to hover docs and signature help
				},
			})
		end
	})

	--JUST FOR FUNNNNN ✨
	use({ "eandrju/cellular-automaton.nvim", enabled = false })
	-- MY PLUGINS
	use("~/.config/nvim/myplugins/wp-cli-nvim")
	use("~/.config/nvim/myplugins/phpdockit")
	use("~/.config/nvim/myplugins/fancyheader")
	use("~/.config/nvim/myplugins/search-gui")
end)
