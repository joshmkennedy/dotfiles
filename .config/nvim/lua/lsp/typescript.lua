local M = {}

local TS7_SERVER = "typescript7"
local LEGACY_SERVER = "typescript-tools"
local TS7_BIN = vim.fn.expand("~/.local/share/nvim/typescript7/bin/tsc")

local modes = {
	ts7 = TS7_SERVER,
	legacy = LEGACY_SERVER,
}

local source_actions = {
	TypeScriptOrganizeImports = "source.organizeImports",
	TypeScriptSortImports = "source.sortImports",
	TypeScriptRemoveUnusedImports = "source.removeUnusedImports",
}

local function project_root(bufnr, on_dir)
	local root = vim.fs.root(bufnr, {
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lock",
		"bun.lockb",
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
	})

	on_dir(root or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
end

local function inlay_hints()
	return {
		parameterNames = {
			enabled = "all",
			suppressWhenArgumentMatchesName = false,
		},
		parameterTypes = { enabled = true },
		variableTypes = { enabled = false },
		propertyDeclarationTypes = { enabled = true },
		functionLikeReturnTypes = { enabled = true },
		enumMemberValues = { enabled = true },
	}
end

function M.source_action(kind)
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { kind },
			diagnostics = {},
		},
	})
end

function M.status()
	local mode = vim.g.typescript_server_mode or "ts7"
	local clients = {}

	for _, client in ipairs(vim.lsp.get_clients()) do
		if client.name == TS7_SERVER or client.name == LEGACY_SERVER then
			table.insert(clients, client.name)
		end
	end

	local attached = #clients > 0 and table.concat(clients, ", ") or "none"
	vim.notify(string.format("TypeScript server: %s (attached: %s)", mode, attached))
	return mode
end

function M.set_mode(mode)
	if mode == "toggle" then
		mode = (vim.g.typescript_server_mode or "ts7") == "ts7" and "legacy" or "ts7"
	end

	if not modes[mode] then
		vim.notify("TypeScript server must be one of: ts7, legacy, toggle, status", vim.log.levels.ERROR)
		return
	end

	local target = modes[mode]
	local previous = mode == "ts7" and LEGACY_SERVER or TS7_SERVER

	vim.lsp.enable(previous, false)
	vim.g.typescript_server_mode = mode
	vim.lsp.enable(target, true)
	vim.notify(string.format("TypeScript server switched to %s", mode))
end

function M.setup()
	if vim.fn.executable(TS7_BIN) ~= 1 then
		vim.notify(string.format("TypeScript 7 executable not found: %s", TS7_BIN), vim.log.levels.ERROR)
		return
	end

	vim.lsp.config(TS7_SERVER, {
		cmd = { TS7_BIN, "--lsp", "--stdio" },
		on_attach = require("lsp.attach"),
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_dir = project_root,
		settings = {
			typescript = {
				suggest = { completeFunctionCalls = true },
				inlayHints = inlay_hints(),
			},
			javascript = {
				suggest = { completeFunctionCalls = true },
				inlayHints = inlay_hints(),
			},
		},
	})

	vim.api.nvim_create_user_command("TypeScriptServer", function(opts)
		local mode = opts.args ~= "" and opts.args or "status"
		if mode == "status" then
			M.status()
		else
			M.set_mode(mode)
		end
	end, {
		nargs = "?",
		complete = function()
			return { "ts7", "legacy", "toggle", "status" }
		end,
		desc = "Select the TypeScript language server",
	})

	for command, kind in pairs(source_actions) do
		local action_kind = kind
		vim.api.nvim_create_user_command(command, function()
			M.source_action(action_kind)
		end, { desc = action_kind })
	end

	local default_mode = vim.env.NVIM_TYPESCRIPT_SERVER or "ts7"
	if not modes[default_mode] then
		default_mode = "ts7"
	end

	vim.lsp.enable({ TS7_SERVER, LEGACY_SERVER }, false)
	vim.g.typescript_server_mode = default_mode
	vim.lsp.enable(modes[default_mode], true)
end

return M
