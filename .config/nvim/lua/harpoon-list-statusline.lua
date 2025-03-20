local harpoon = require("harpoon")
local M = {}

harpoon:list()
function M.component()
	local list = harpoon:list():display();
	local out = ""
	for _, value in pairs(list) do
		local label = vim.fs.basename(value)
		if value == vim.fn.expand("%") then
			label = "*" .. label .. " "
			label = "%#activeHarpoonTab#"..label .. "%*"
		else
			label = " " .. label .. " "
			label = "%#harpoonTab#"..label .. "%*"
		end
		out = out .. label .. " | "
	end
	return out
end

return M
