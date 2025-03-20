local M = {}

local function get_first_terminal()
	local terminal_chans = {}

	for _, chan in pairs(vim.api.nvim_list_chans()) do
		if chan["mode"] == "terminal" and chan["pty"] ~= "" then
			table.insert(terminal_chans, chan)
		end
	end

	table.sort(terminal_chans, function(left, right)
		return left["buffer"] < right["buffer"]
	end)
	if terminal_chans[1] == nil then
		local buf = vim.api.nvim_get_current_buf()
		vim.cmd[[:term]]
		vim.api.nvim_set_current_buf(buf)

		return get_first_terminal()
	end
	return terminal_chans[1]["id"]
end
function M.terminal_send(text)
	local first_terminal_chan = get_first_terminal()

	vim.api.nvim_chan_send(first_terminal_chan, text)
end

return M
