vim.go.laststatus = 3

vim.diagnostic.config({
	highlight = {
		enable = true,
		virtual_text = true,
	},
	virtual_text = {
		prefix = '●',
	},
})
