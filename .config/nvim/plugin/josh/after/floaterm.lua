-- vim.g.floaterm_borderchars="─│─│╭╮╯╰"
vim.g.floaterm_borderchars="─│─│:╮╯╰"

vim.cmd[[hi Floaterm guibg=#202336]]
vim.cmd[[hi FloatermBorder guifg=#7AA2F7 guibg=#202336]]
-- yarn add 
vim.api.nvim_create_user_command("YarnA",function (opts)
	local args = opts.args
	vim.cmd("FloatermNew --autoclose=1 --height=0.2 --width=0.2 --name=yarn_add --position=bottomright yarn add "..args)
end,{nargs="*"})


-- wp shell --require file
vim.api.nvim_create_user_command("WPShell", function(opts)
	local args = opts.args
	vim.cmd("FloatermNew --autoclose=1 --height=0.66 --width=0.5 --name=wp_shell wp shell" .. args)
end,{
	nargs="*"
})

vim.api.nvim_create_user_command("Node", function()
	vim.cmd[[FloatermNew --height=0.6 --width=0.5 --name=NodeShell node]]
end,{})

vim.api.nvim_create_user_command("PHPLogs", function(opts)
	vim.cmd("FloatermNew --cwd=~/work/".. opts.args .."/logs/php --wintype=vsplit --width=0.33 --title=LOGS tail -f error.log")
	end,{
		nargs="*"
})
