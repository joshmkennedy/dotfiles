local harpoon = require("harpoon")
local termsend = require("termsend")
harpoon:setup({
	["term"] = {
		select = function(list_item, list, option)
			termsend.terminal_send(list_item.value .. "\n")
		end,
	},
})
