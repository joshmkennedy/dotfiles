return {
	'hrsh7th/nvim-cmp',
	lazy = false,
	dependencies = {
		'onsails/lspkind-nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-cmdline',
		'f3fora/cmp-spell',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		local cmp = require 'cmp'
		cmp.setup {
			sources = {
				{ name = "luasnip" }, -- For luasnip users.
				-- {name="supermaven"},
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			},

			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-x>"] = cmp.mapping.close(),

				["<c-y>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<c-space>"] = cmp.mapping.complete(),
			},
			preselect = cmp.PreselectMode.None,
			formatting = {
				format = require 'lspkind'.cmp_format({
					with_text = true,
					menu = {
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						luasnip = "[SNIP]",
						cmdline = "[CMD]",
						todo_tags = "[TODO]",--custom in membergate
					},
				}),
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		}
		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			sources = cmp.config.sources({
				{ name = "path" },
			}, {

				{ name = "cmdline" },
			}),
		})
vim.keymap.set({ "i", "c" }, "<C-n>", function()
	cmp.select_next_item()
end)
vim.keymap.set({ "i", "c" }, "<C-p>", function()
	cmp.select_prev_item()
end)

	end,
}
