vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = "highlight_yank",
	callback = function()
		-- highlight yanked text
		require("vim.hl").on_yank({ timeout = 40 })
	end,
})
