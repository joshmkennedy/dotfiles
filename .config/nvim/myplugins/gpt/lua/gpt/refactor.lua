local utils = require('gpt.utils')
local window = require("gpt.window")
local api = require("gpt.api")

local Command = {}

function Command:new()
	state = {
		window = window:new(),
		args = nil
	}
	setmetatable(state, self)
	self.__index = self
	return state
end

function Command:loadArgs(cmdArgs)
    local filetype = utils.filetype()
    local code = utils.tbl2String(utils.getlines(cmdArgs.line1, cmdArgs.line2))
    self.args = {filetype = filetype, code = code}
		return self.args
end

function Command:run(otherRequirements, args, cb)
	local info = self:loadArgs(args)
	api.run({
			{
				role = "system",
				content =
				[[
				Write code in that refactors the given code.
				Dont use other functions unless you are providing them.
				Only output the code. Do not wrap it in back ticks just the code.
				If explaination is nessecary put it in code comments in the give language.
				If the code is already clean and show a comment in the language that is provided at the top, that says its clean, and give suggestions when it would need to be refactored as comments
					]]
			},
			{ role = "user", content = "Please refactor this " .. info.filetype .. " code\n" .. info.code .. "\n" .. "also " .. otherRequirements}
		},
		cb
	)
end

return Command
