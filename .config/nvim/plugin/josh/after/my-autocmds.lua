vim.api.nvim_create_augroup("highlight_yank",{clear=true})

vim.api.nvim_create_autocmd({"TextYankPost"}, {
	group = "highlight_yank",
	command = "lua require('vim.highlight').on_yank({timeout=40})",
})

local change_filetype_group = vim.api.nvim_create_augroup("change_filetype",{clear=true})
vim.api.nvim_create_autocmd({"BufEnter"},{
	group=change_filetype_group,
	pattern="*.twig",
	command="setfiletype twig.html",
})

local is_git_dir = function()
  return os.execute('git rev-parse --is-inside-work-tree >> /dev/null 2>&1')
end
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     local bufferPath = vim.fn.expand('%:p')
--     if vim.fn.isdirectory(bufferPath) ~= 0 then
--       local ts_builtin = require('telescope.builtin')
--       vim.api.nvim_buf_delete(0, { force = true })
--       if is_git_dir() == 0 then
--         ts_builtin.git_files({ show_untracked = true })
--       else
--         ts_builtin.find_files()
--       end
--     end
--   end,
-- })

