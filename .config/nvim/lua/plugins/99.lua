return {
	-- Plugin spec for a forked 99 build with CodexProvider support.
	"joshmkennedy/99",
	branch = "add-codex-provider",
	config = function()
		-- Load the plugin module so we can configure it and call its commands.
		local _99 = require("99")

		-- Use the Codex provider with the GPT-5.4 mini model.
		_99.setup({
			provider = _99.Providers.CodexProvider,
			model = "gpt-5.4-mini",
		})

		-- Search from normal mode with <leader>9s.
		vim.keymap.set("n", "<leader>9s", function()
			_99.search()
		end)

		-- Send the current visual selection with <leader>99.
		vim.keymap.set("v", "<leader>99", function()
			_99.visual()
		end)
	end,
}
