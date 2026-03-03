return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio", -- 👈 required by nvim-dap-ui
			"theHamsta/nvim-dap-virtual-text",
			-- {
				-- "microsoft/vscode-js-debug",
				-- This is the actual debugger (Node project)
				-- build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
			-- },
			{
				"mxsdev/nvim-dap-vscode-js", -- Lua bridge
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
				local pwaType = "pwa-" .. adapterType

				dap.adapters[pwaType] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "/Users/joshkennedy/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter",
						args = { "${port}" },
					},
				}

				-- this allow us to handle launch.json configurations
				-- which specify type as "node" or "chrome" or "msedge"
				dap.adapters[adapterType] = function(cb, config)
					local nativeAdapter = dap.adapters[pwaType]

					config.type = pwaType

					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end

			local enter_launch_url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end

			for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file using Node.js (nvim-dap)",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to process using Node.js (nvim-dap)",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					-- requires ts-node to be installed globally or locally
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file using Node.js with ts-node/register (nvim-dap)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeArgs = { "-r", "ts-node/register" },
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch Chrome (nvim-dap)",
						url = enter_launch_url,
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
					},
					{
						type = "pwa-msedge",
						request = "launch",
						name = "Launch Edge (nvim-dap)",
						url = enter_launch_url,
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
					},
				}
			end


			-- 🔑 Keymaps
			local map = vim.keymap.set
			map("n", "<F5>", dap.continue, { desc = "DAP continue" })
			map("n", "<F2>", dap.step_over, { desc = "DAP step over" })
			map("n", "<F3>", dap.step_into, { desc = "DAP step into" })
			map("n", "<F1>", dap.step_out, { desc = "DAP step out" })
			map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
			map("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "DAP conditional breakpoint" })
			map("n", "<leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "DAP log point" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP open REPL" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP toggle UI" })
		end,
	},
}
