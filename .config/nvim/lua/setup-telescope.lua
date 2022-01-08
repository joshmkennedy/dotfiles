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
    }
}
