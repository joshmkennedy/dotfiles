local cmp = require("cmp")
-- cmp stuff
local lspkind = require("lspkind")
lspkind.init()
-- Setup nvim-cmp.
cmp.setup({

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
	sources = {
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
	},

	formatting = {
		format = lspkind.cmp_format({
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
})

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
