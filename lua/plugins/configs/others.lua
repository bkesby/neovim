local g = vim.g
local rc = require("rc").options.plugin

local M = {}

M.better_escape = function()
   require("better_escape").setup {
      mapping = rc.better_escape.mapping,
      timeout = rc.better_escape.timeout or 200,
   }
end

M.blankline = function()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      show_current_context = true,
      context_patterns = { "class", "function", "method", "object", "dictionary", "table", "^if", "while", "for", "with", "case", "try", "except" },
      filetype_exclude = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults", "Telescope" },
      buftype_exclude = { "terminal" },
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
   }
end

M.colorizer = function()
   local present, colorizer = pcall(require, "colorizer")
   if present then
      colorizer.setup({ "*" }, {
         RGB = true,
         RRGGBB = true,
         names = false,
         RRGGBBAA = true,
         rgb_fn = true,
         hsl_fn = true,
         css = true,
         css_fn = true,
         -- Display mode
         mode = "background",
      })
      vim.cmd("ColorizerReloadAllBuffers")
   end
end

M.comment = function()
   local present, nvim_comment = pcall(require, "nvim_comment")
   if present then nvim_comment.setup() end
end

M.harpoon = function()
   local present, harpoon = pcall(require, "harpoon")
   if present then
      harpoon.setup {
         save_on_toggle = rc.harpoon.save_on_toggle,
         save_on_change = rc.save_on_change,
         enter_on_sendcmd = rc.enter_on_sendcmd,
      }
   end
end

M.lastplace = function()
   require("nvim-lastplace").setup {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help", "dashboard" },
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

M.undo = function()
   g.undotree_HighlightChangedWithSign = rc.undo.highlight_changed_sign
   g.undotree_WindowLayout = rc.undo.window_layout
   g.undotree_SetFocusWhenToggle = rc.undo.set_focus_when_toggle
end

M.window = function()
   local present, nvim_window = pcall(require, "nvim-window")
   if present then
      nvim_window.setup {
         -- last character has to be placed first
         chars = { ";", "a", "s", "d", "f", "j", "k", "l" },
         border = "none",
      }
   end
end

M.wordmotion = function() g.wordmotion_uppercase_spaces = { "\"", "'", ".", ":", ";", ",", "(", ")" } end

return M
