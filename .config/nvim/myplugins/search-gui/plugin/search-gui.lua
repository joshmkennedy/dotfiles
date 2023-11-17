
vim.api.nvim_create_user_command("Search", function (args)
	require'search-gui'.search()
end, {})
-- vim.
