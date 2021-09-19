local rc = require("rc").options.plugin
local M = {}

M.better_escape = function()
   vim.g.better_escape_interval = rc.better_escape.interval
   vim.g.better_escape_shortcut = rc.better_escape.shortcut
end

M.comment = function()
   local present, nvim_comment = pcall(require, "nvim_comment")
   if present then
      nvim_comment.setup()
   end
end

M.window = function()
   local present, nvim_window = pcall(require, "nvim-window")
   if present then
      nvim_window.setup {
         -- 'x' used as dummy first skipped character
         chars = { 'x', 'a', 's', 'd', 'f', 'j', 'k', 'l' },
         border = "none",
      }
   end
end

return M
