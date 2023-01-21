require('lualine').setup {
 options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color={
          added = 'lualine_b_diagnostics_info_normal',
          modified = 'lualine_b_diagnostics_hint_command',
          removed = 'lualine_b_diagnostics_error_insert'
        },
      },
      'diagnostics'
    },
    lualine_c = {
    {
      'filename',
      file_status = true,      -- Displays file status (readonly status, modified status)
      path = 0,                -- 0: Just the filename

      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                               -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unamed = '[No Name]', -- Text to show for unnamed buffers.
      },
      fmt = function(text)
        return "%=" .. text
      end
    }
  },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

