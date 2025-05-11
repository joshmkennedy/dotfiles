local devicons = require("nvim-web-devicons")
devicons.setup({
	color_icons = true,
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
	override = {
		tsx = {
			icon = "",
			color = "#1354bf",
			cterm_color = "26",
			name = "typescriptreact",
		}
	},
})
