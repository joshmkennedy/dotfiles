local utils = require("gpt.utils")
local Job = require("plenary.job")
local M = {}

local function chatData(messages)
	local config = {
		model = "gpt-3.5-turbo",
		messages = messages,
		temperature = 0.7,
	}
	local ok, json = pcall(vim.json.encode, config)
	if not ok or json == nil then
		vim.notify("Could not form json from config")
	end
	return json
end

M.apiURL = "https://api.openai.com/v1/chat/completions"

function M.run(messages, cb)
	local payload = chatData(messages)
	Job:new({
		command = "curl",
		args = {
			"-X",
			"POST",
			"--silent",
			"--no-buffer",
			"-H",
			"Content-Type: application/json",
			"-H",
			"Authorization: Bearer " .. os.getenv("OPENAI_API_KEY"),
			"-d",
			payload,
			M.apiURL,
		},
		on_exit = function(j, return_val)
			if (return_val == 0) then
				local resp = utils.tbl2String(j:result())
				local ok, json = pcall(vim.json.decode, resp)
				P(json)
				if not ok then
					vim.schedule(function()
						vim.notify("an error occured")
					end)
					return
				end
				vim.schedule(function()
					P(json)
				end)
				if json == nil then
					vim.schedule(function()
						vim.notify("gpt returned no results")
					end)
				end
				vim.schedule(function()
					cb(json.choices[1].message.content)
				end)
			end
		end,
		on_stderr = function(_, return_val)
			P("error")
			P(return_val)
			-- P(j)
		end,
	}):start()
end

return M
