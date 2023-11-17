require('refactoring').setup({
	print_var_statements = {
		php = {
"error_log(sprintf('DEBUG:'.\"\\n\".'%s %%s'.%s, print_r(%s,true)));"
		}
	}
})



