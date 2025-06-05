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
vim.bo.tabstop = 4 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 4 -- size of an indentation (sw).
vim.bo.expandtab = true -- always uses spaces instead of tab characters (et).
vim.bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).
