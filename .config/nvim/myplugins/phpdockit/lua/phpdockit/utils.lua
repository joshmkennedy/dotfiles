local M = {}

function M.get_bufnr(bufnr)
    return bufnr or vim.api.nvim_get_current_buf()
end

function M.filetype(bufnr)
    return vim.bo[bufnr].ft;
end

function M.tableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

return M
