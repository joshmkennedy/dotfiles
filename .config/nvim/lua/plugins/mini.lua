return {
	"echasnovski/mini.nvim",
	version = false,
	dependencies = {
		'JoosepAlviste/nvim-ts-context-commentstring'
	},
	config = function()
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
				end,
			},
		})
		require("mini.surround").setup({
			mappings = {
				add = 'ys',         -- Add surrounding in Normal and Visual modes
				delete = "yd",      -- Delete surrounding
				find = '<leader>yf',        --" Find surrounding (to the right)
				find_left = 'ysF',  -- Find surrounding (to the left)
				highlight = 'ysh',  -- Highlight surrounding
				replace = "yr",     -- Replace surrounding
				update_n_lines = "ysn", -- Update `n_lines`

				suffix_last = 'l',  -- Suffix to search with "prev" method
				suffix_next = 'n',  -- Suffix to search with "next" method
			},
		})
	end,
}
