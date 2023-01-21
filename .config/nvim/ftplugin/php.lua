-- For some reason php files don't keep the autoindent option
-- This makes sure autoindent is set to true when entering a php buffer
local group = vim.api.nvim_create_augroup("autoindent-me",{clear=true})

vim.api.nvim_create_autocmd({"BufEnter"}, {
	pattern={"*.php"},
	group = group,
	callback = function ()
		vim.opt.autoindent = true
	end
})


