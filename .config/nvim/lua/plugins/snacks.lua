return {
	"folke/snacks.nvim",
	priority = 10000,
	lazy = false,
	---@type snacks.Config
	opts = {
		rename = {
			enabled = true,
		},
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			on_close = function()
				require "neo-tree".close_all()
			end,
			sources = {
				-- custom sources
			},
		},
		notifier = {
			enabled = true,
			top_down = false,
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = {
			enabled = false,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = false,         -- show open fold icons
				git_hl = false,       -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},
		words = { enabled = true },
	},
	keys = {

		-- PICKER --

		-- FUZZY FIND
		{ "<leader>ff", function()
			-- Snacks.picker.files({
			-- 	cwd = vim.fn.getcwd()
			-- })
			Snacks.picker.files({
				cwd = vim.fn.getcwd(),
			})
		end },
		-- GREP
		{ "<leader>gg", function()
			Snacks.picker.grep()
		end },
		-- ICONS
		{ "<leader>fi", function() Snacks.picker.icons() end },
		-- RESUME
		{ "<leader>tt", function() Snacks.picker.resume() end },
		-- Pick a PICKER
		{ "<leader>T",  function() Snacks.picker.pickers() end },
		-- Pick a workspace symbol
		{ "<leader>fs", function() Snacks.picker.lsp_workspace_symbols() end },
	}
}
