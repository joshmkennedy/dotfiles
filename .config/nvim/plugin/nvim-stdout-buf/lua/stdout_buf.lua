
local api = vim.api
local buf, win
local position = 0

local function open_todo_panel()
	buf = api.nvim_create_buf(false, true) -- creates the buffer
	api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	local width = api.nvim_get_option("columns")
	local height = api.nvim_get_option("lines")

	-- panel size ( 55 col * window height - 4 rows)
	local todo_panel_width = 55
	local todo_panel_height = math.ceil(height  - 4)
	-- panel position (top right)
	local y = 0
	local x = math.ceil((width - todo_panel_width) )

	local panel_options = {
		style = "minimal",
		relative = "editor",
		width = todo_panel_width,
		height = todo_panel_height,
		row = y,
		col = x,
		border= "double",
	}
	
	win = api.nvim_open_win(buf, true, panel_options)
end

local function update_view() 
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)

  local result = vim.api.nvim_call_function('systemlist', {
      'todo'
    })
	
  for k,v in pairs(result) do
    result[k] = '  '..result[k]
  end

  api.nvim_buf_set_lines(buf, 1, -1, false, result)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function run_command() 

end

local function close_todo_panel()
  api.nvim_win_close(win, true)
end

local function add_keymaps()
  local mappings = {
    ['<cr>'] = 'complete_todo()',
    q = 'close_todo_panel()',
  }

  for k,v in pairs(mappings) do
    api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"stdout_buf".'..v..'<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
  local other_chars = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'i', 'n', 'o', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  }
  for k,v in ipairs(other_chars) do
    api.nvim_buf_set_keymap(buf, 'n', v, '', { nowait = true, noremap = true, silent = true })
    api.nvim_buf_set_keymap(buf, 'n', v:upper(), '', { nowait = true, noremap = true, silent = true })
    api.nvim_buf_set_keymap(buf, 'n',  '<c-'..v..'>', '', { nowait = true, noremap = true, silent = true })
  end
end

local function cmd_on_cur_todo(cmd)
	local curline = api.nvim_eval('line(".")') - 1
	--local curline = 2
	print(vim.inspect(curline))
	if curline > 0 
		then api.nvim_call_function('system',{'todo '..cmd..' '..curline})
	end
	update_view()
end

local function complete_todo()
	cmd_on_cur_todo('complete')
end
local function mark_current()
	cmd_on_cur_todo('current')
end
local function delete_todo()
	cmd_on_cur_todo('delete')
end
local function add_todo()
	--todo
end

local function stdout_buf()
	open_todo_panel()
	add_keymaps()
	update_view()
end

return {
	stdout_buf = stdout_buf,
	open_todo_panel = open_todo_panel,
	close_todo_panel = close_todo_panel,
	complete_todo = complete_todo,
}
