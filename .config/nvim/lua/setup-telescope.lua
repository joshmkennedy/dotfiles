local telescope = require('telescope')

telescope.setup {
    defaults = {
       entry_prefix = ""
    },
    pickers = {
        find_files = {
            entry_prefix = "",
            hidden = false
        }
    },
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {
        -- even more opts
      }
    }
  }
}
require("telescope").load_extension("ui-select")
