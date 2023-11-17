local hl_winbar_path = 'WinBarPath'
local hl_winbar_file = 'WinBarFile'
local hl_winbar_symbols = 'WinBarSymbols'
local hl_winbar_file_icon = 'WinBarFileIcon'
local status_web_devicons_ok, web_devicons = pcall(require, 'nvim-web-devicons')
local opts ={
	show_file_path = true,
	show_symbols = true,

	colors = {
		path = '', -- You can customize colors like #c946fd
		file_name = '',
		symbols = '',
	},

	icons = {
		file_icon_default = '',
		seperator = "",
		editor_state = '●',
		lock_icon = '',
	},

	exclude_filetype = {
		'help',
		'startify',
		'dashboard',
		'packer',
		'neogitstatus',
		'NvimTree',
		'Trouble',
		'alpha',
		'lir',
		'Outline',
		'spectre_panel',
		'toggleterm',
		'qf',
	}
}

local isempty = function (s)
    return s == nil or s == ''
end

local winbar_file = function()
    local file_path = vim.fn.expand('%:~:.:h')
    local filename = vim.fn.expand('%:t')
    local file_type = vim.fn.expand('%:e')
    local value = ''
    local file_icon = ''

    file_path = file_path:gsub('^%.', '')
    file_path = file_path:gsub('^%/', '')

    if not isempty(filename) then
        local default = false

        if isempty(file_type) then
            file_type = ''
            default = true
        end

        if status_web_devicons_ok then
            file_icon = web_devicons.get_icon(filename, file_type, { default = default })
            hl_winbar_file_icon = "DevIcon" .. file_type
        end

        if not file_icon then
            file_icon = opts.icons.file_icon_default
        end

        file_icon = '%#' .. hl_winbar_file_icon .. '#' .. file_icon .. ' %*'

        value = ' '
				local file_path_list = {}
				local _ = string.gsub(file_path, '[^/]+', function(w)
					table.insert(file_path_list, w)
				end)

				for i = 1, #file_path_list do
					value = value .. '%#' .. hl_winbar_path .. '#' .. file_path_list[i] .. " " ..opts.icons.seperator .. " " .. '%*'
				end
        value = value .. file_icon
        value = value .. '%#' .. hl_winbar_file .. '#' .. filename .. '%*'
    end

    return value

end
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",
		section_separators = { left = '', right = '' },
		-- section_separators = { left = "", right = "" },
		component_separators = '|',
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ 'mode',
				fmt = function(str) 
					if(str == "NORMAL") then
						return "󱣱"
					end
					if(str == "INSERT") then
						return ""
					end
					if(str == "COMMAND") then 
						return "󰘳"
					end
					if(str == "V-LINE") then
						return "󰈈"
					end
					if(str == "VISUAL") then 
						return "󰛐"
					end
					return str:sub(1,1)
				end,
				separator = { left = '' },
				right_padding = 0,
				left_padding=2,
			},
		},
		lualine_b = {
			"branch",
			{
				"diff",
				colored = true,
				diff_color = {
					added = "lualine_b_diagnostics_info_normal",
					modified = "lualine_b_diagnostics_hint_command",
					removed = "lualine_b_diagnostics_error_insert",
				},
			},
			{"diagnostics",
				separator = { right = '' },
		},
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				path = 0, -- 0: Just the filename

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unamed = "[No Name]", -- Text to show for unnamed buffers.
				},
				fmt = function(text)
					return text
				end,
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
	winbar ={
    lualine_a = {
		},
    lualine_b = {},
    lualine_c = {
		},
    lualine_x = {winbar_file},
    lualine_y = {},
    lualine_z = {}
  },
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {winbar_file},
		lualine_y = {},
		lualine_z = {}
	}
})

