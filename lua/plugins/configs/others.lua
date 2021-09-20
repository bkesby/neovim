local g = vim.g
local rc = require("rc").options.plugin

local M = {}

-- Switch to lua version if I can get it to work with coq
-- M.autopairs = function()
--    local present, autopairs = pcall(require, "nvim-autopairs")
--    if present then
--       autopairs.setup {
--          check_ts = true,
--       }
--    end
-- end

M.better_escape = function()
   g.better_escape_interval = rc.better_escape.interval
   g.better_escape_shortcut = rc.better_escape.shortcut
end

M.comment = function()
   local present, nvim_comment = pcall(require, "nvim_comment")
   if present then
      nvim_comment.setup()
   end
end

M.neoscroll = function()
   local present, neoscroll = pcall(require, "neoscroll")
   if present then
      neoscroll.setup {
         hide_cursor = true,
         respect_scrolloff = true,
      }
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
