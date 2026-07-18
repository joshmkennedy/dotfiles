return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup {
			dim_inactive_windows = true,
			styles = {
				transparency = true,
			}
			-- Your custom configuration comes here
			-- or leave it empty to use the default settings
			-- Refer to the configuration section below

		}
		-- vim.cmd [[colorscheme rose-pine]]
	end,
}
