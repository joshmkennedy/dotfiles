return {
	'dmmulroy/tsc.nvim',
	config = function()
		require('tsc').setup({
			use_trouble_qflist = true,
			use_diagnostics = true,
			flags = {
				watch = false,
			},
		})
	end,
}
