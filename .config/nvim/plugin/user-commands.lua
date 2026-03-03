vim.api.nvim_create_user_command("GCA", function()
	vim.cmd("Git add -A")
	vim.cmd("Git commit --amend")
end, {})
