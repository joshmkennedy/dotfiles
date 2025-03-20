local M = {}
function M.getlines(start, end_)
	local lines = vim.api.nvim_buf_get_lines(0, start, end_, false)
	return lines
end

function M.tbl2String(tbl)
	local strings = ""
	for _, str in pairs(tbl) do
		strings = strings .. str .. "\n"
	end
	return strings
end

function M.splitStr(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

function M.filetype()
	return vim.bo[vim.api.nvim_get_current_buf()].ft;
end

return M
