vim.g.fold_line_char_open_start = "╭"
vim.g.fold_line_char_open_end = "╰"

vim.cmd [[highlight FoldLine guibg='none' guifg='#54546D' ]]
vim.cmd [[highlight FoldLineCurrent guibg='none' guifg='#54546D' ]]
vim.g.fold_line_char_open_start = "╭"
vim.g.fold_line_char_open_end = "╰"
vim.g.fold_line_current_fold_only = true

-- Set the fold method to 'expr'


-- Set the fold expression to use nvim-treesitter
--vim.o.foldexpr = require 'nvim-treesitter.fold'.get_fold_indic(vim.api.nvim_get_current_line())
vim.cmd [[set foldmethod=expr]]
vim.cmd [[  set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[ set nofoldenable]]
vim.cmd [[set foldlevel=4]]

function HighlightedFoldtext()
  local pos = vim.v.foldstart
  local line = vim.api.nvim_buf_get_lines(0, pos - 1, pos, false)[1]
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  local parser = vim.treesitter.get_parser(0, lang)
	if parser == nil then
		return
	end
  local query = vim.treesitter.query.get(parser:lang(), "highlights")

  if query == nil then
    return vim.fn.foldtext()
  end

  local tree = parser:parse({ pos - 1, pos })[1]
  local result = {}

  local line_pos = 0

  local prev_range = nil

  for id, node, _ in query:iter_captures(tree:root(), 0, pos - 1, pos) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    if start_row == pos - 1 and end_row == pos - 1 then
      local range = { start_col, end_col }
      if start_col > line_pos then
        table.insert(result, { line:sub(line_pos + 1, start_col), "Folded" })
      end
      line_pos = end_col
      local text = vim.treesitter.get_node_text(node, 0)
      if prev_range ~= nil and range[1] == prev_range[1] and range[2] == prev_range[2] then
        result[#result] = { text, "@" .. name }
      else
        table.insert(result, { text, "@" .. name })
      end
      prev_range = range
    end
  end

  return result
end

local bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
local hl = vim.api.nvim_get_hl(0, { name = "Folded" })
hl.bg = bg
vim.api.nvim_set_hl(0, "Folded", hl)

vim.opt.foldtext=[[luaeval('HighlightedFoldtext')()]]

