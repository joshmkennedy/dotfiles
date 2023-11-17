local Job = require('plenary.job')
local utils = require('wp-cli-nvim.utils')
local cmd_parser = require('wp-cli-nvim.parse-args')
local P = utils.P

if vim.g.wp_cli_nvim_loaded == 1 then
  return
end
vim.g.wp_cli_nvim_loaded = 1


vim.api.nvim_create_user_command("Wp", function(opts)
  local parser = cmd_parser:new()
  local args = parser:parse(opts.fargs)
 Job:new({
     command = "wp",
     args = args,
     on_exit = function (j, return_val)
      if (return_val == 0) then
        P(j:result())
      end
     end,
     on_stderr = function(_, return_val)
       P("error")
       P(return_val)
       -- P(j)
     end,
   }):sync()
end, {
  nargs="*",
})
