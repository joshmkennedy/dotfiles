require("zen-mode").setup({
	plugins = {
		options = {
			laststatus = 0, -- turn off the statusline in zen mode
		},
		tmux = { enabled = true },
		kitty = { enabled = true, font = "+10" },
		twilight = { enabled = true },
	}
})

require("zen-mode").setup({
	plugins = {
		options = {
			laststatus = 0, -- turn off the statusline in zen mode
		},
		tmux = { enabled = true },
		kitty = { enabled = true, font = "+5" },
		twilight = { enabled = true },
	}
})

