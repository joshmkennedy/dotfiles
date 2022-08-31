local ok, dap = pcall(require, "dap")

if not ok then P("NOOOOOO") 
end



require('dap-go').setup()
require("dapui").setup()
