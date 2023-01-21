vim.api.nvim_create_augroup("highlight_yank",{clear=true})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
	group = "highlight_yank",
	command = "lua require('vim.highlight').on_yank({timeout=40})",
})

local change_filetype_group = vim.api.nvim_create_augroup("change_filetype",{clear=true})
vim.api.nvim_create_autocmd({"BufEnter"},{
	group=change_filetype_group,
	pattern="*.twig",
	command="setfiletype twig.html",
})

