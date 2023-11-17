local M = {}

M.default_maps = {
	{
		mode="n",
		lhs = "<enter>",
		rhs =function() M.enter_cmd() end,
	},
	{
		mode="n",
		lhs="<tab>",
		rhs =function() M.tab_cmd() end,
	},
}

M.set_up_commands = function(cmds)
	M.tab_cmd = cmds.tab_cmd
	M.enter_cmd = cmds.enter_cmd
end

M.add_maps = function(popups)
	for name, config in pairs(popups) do
		for _, map in ipairs(M.default_maps) do
			config.popup:map(map.mode, map.lhs, map.rhs,{})
		end
		if config.cmds ~= nil then

			for _, map in ipairs(config.cmds) do
				config.popup:map(map.mode, map.lhs, map.rhs,{})
			end
		end
	end
end

local function setup_maps(options)
	M.set_up_commands(options.cmds)
	M.add_maps(options.popups)
	return M
end

return setup_maps
