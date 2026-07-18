return {
	cmd = { "xcrun", "sourcekit-lsp" },
	filetypes = { "swift" },
	root_markers = {
		"Package.swift",
		".git",
	},
	on_attach = require("lsp.attach"),
}
