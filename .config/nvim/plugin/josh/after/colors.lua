-- vim.cmd[[colorscheme catppuccin]]
-- vim.g.catppuccin_flavour="mocha"
--
require("tokyonight").setup({
  -- use the night style
  style = "storm",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.blue
    colors.error = "#FF3F89"
  end,
	on_highlights = function(hl, c)
		hl['@text.todo'] = {
			fg = c.bg_dark,
			bg = c.orange,
		}
		hl['@text.note'] = {
			fg = c.bg_dark,
			bg = c.blue,
		}
	end
})
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[highlight Normal guibg=none ctermbg=none]]
-- vim.cmd[[highlight clear SignColumn]]
vim.cmd[[highlight LineNr guifg=#9A86BE]]

--TODO(joshmkennedy): nothing to note
--FIXME(joshmkennedy): nothing to note
--NOTE(joshmkennedy): noting to note
--HACK:
--BUG:
--XXX:
--WARNING:
--
vim.api.nvim_create_user_command('RemoveBG', 'hi Normal guibg=none',{})
