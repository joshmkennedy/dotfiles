return {
	on_attach = require "lsp.attach",
	 settings = {
    Lua = {
      diagnostics = { globals = { 'love' } },  -- Recognize LÖVE globals (no undefined warnings)
      workspace = { library = { '/Users/joshkennedy/projects/love-2d/bin/love.app/Contents/love.framework/Resources/' } },  -- LÖVE API autocomplete
--(adjust path if needed)
      telemetry = { enable = false },
    },
  }
}
