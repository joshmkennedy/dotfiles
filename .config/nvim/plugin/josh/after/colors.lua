-- vim.cmd[[colorscheme catppuccin]]
-- vim.g.catppuccin_flavour="mocha"

-- require("tokyonight").setup({
--   -- use the night style
--   style = "storm",
--   -- disable italic for functions
--   styles = {
--     functions = {}
--   },
--   sidebars = { "qf", "vista_kind", "terminal", "packer" },
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   on_colors = function(colors)
--     colors.hint = colors.blue
--     colors.error = "#FF3F89"
--   end,
-- 	on_highlights = function(hl, c)
-- 		hl['@text.todo'] = {
-- 			fg = c.bg_dark,
-- 			bg = c.orange,
-- 		}
-- 		hl['@text.note'] = {
-- 			fg = c.bg_dark,
-- 			bg = c.blue,
-- 		}
-- 	end
-- })


-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {
			bold=true,
		},
    keywordStyle = {
			bold=true,
		},
    statementStyle = { bold = true },
    typeStyle = {
		},
    transparent = true,         -- do not set background color
    dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- vim.cmd[[colorscheme dracula]]
vim.cmd[[colorscheme kanagawa]]

vim.cmd[[highlight clear SignColumn]]
vim.cmd[[highlight LineNr guibg=none]]
