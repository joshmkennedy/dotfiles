local dap, dapui = require('dap'), require('dapui')

dapui.setup()

--Go (delv)
require('dap-go').setup()

--JS
--Chrome
-- dap.adapters.chrome = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
-- }
--
-- require("dap-vscode-js").setup({
-- 	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- 	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
-- 	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
-- 	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
-- 	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- 	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- 	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
-- 	require("dap").configurations[language] = {
-- 		... -- see below
-- 	}
-- end


dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.configurations.javascript = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.configurations.typescript = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}"
	}
}

dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { os.getenv("HOME") .. '/.config/dap-adapters/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		port = 9003,
		localSourceRoot = '/Users/joshkennedy/work/johndickerson'
	}
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close()
end
