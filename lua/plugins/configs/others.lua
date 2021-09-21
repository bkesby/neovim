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

M.blankline = function()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      show_current_context = true,
      context_patterns = {
         "class",
         "function",
         "method",
         "object",
         "dictionary",
         "table",
         "^if",
         "while",
         "for",
         "with",
         "case",
         "try",
         "except",
      },
      filetype_exclude = {
         "help",
         "terminal",
         "dashboard",
         "packer",
         "lspinfo",
         "TelescopePrompt",
         "TelescopeResults",
      },
      buftype_exclude = {"terminal"},
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
   }
end

M.codi = function()

end

M.comment = function()
   local present, nvim_comment = pcall(require, "nvim_comment")
   if present then
      nvim_comment.setup()
   end
end

M.lastplace = function()
   require("nvim-lastplace").setup {
      lastplace_ignore_buftype = {"quickfix", "nofile", "help", "dashboard"},
      lastplace_open_folds = true,
   }
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
         chars = {"x", "a", "s", "d", "f", "j", "k", "l"},
         border = "none",
      }
   end
end

return M
