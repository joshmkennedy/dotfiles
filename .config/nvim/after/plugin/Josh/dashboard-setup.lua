local db = require 'dashboard'
db.setup({
	theme = 'doom',
	config = {
		week_header = {
			enable = true,
		},
		-- Hyper Config
		shortcut = {
			{ desc = ' Update', group = '@property', action = 'PackerSync', key = 'u' },
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				icon = '󰊢 ',
				-- icon_hl = '@variable',
				desc = 'Git Log',
				group = 'DiagnosticHint',
				action = 'Gclog',
				key = 'g',
			},
			-- {
			--   desc = ' dotfiles',
			--   group = 'Number',
			--   action = 'Telescope dotfiles',
			--   key = 'd',
			-- },
		},
		-- Doom Config
		center = {
			{ desc = ' Update', group = '@property', action = 'PackerSync', key = 'u' },
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				icon = '󰊢 ',
				-- icon_hl = '@variable',
				desc = 'Git Log',
				group = 'DiagnosticHint',
				action = 'Gclog',
				key = 'g',
			},
			-- {
			--   desc = ' dotfiles',
			--   group = 'Number',
			--   action = 'Telescope dotfiles',
			--   key = 'd',
			-- },
		},
		footer = {
			"hi"
		}
	},
})
