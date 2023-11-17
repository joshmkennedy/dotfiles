local M = {}

function M.parse_param(param_node)
	local param = {}
	for part,part_name in param_node:iter_children() do
		if part_name ~= nil then
			param[part_name] = vim.treesitter.query.get_node_text(part, 0, {})
		end
	end
	return param
end

return M
