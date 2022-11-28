local present, bufferline = pcall(require, "bufferline")
if not present then return end

local colors = require("onedarkpro").get_colors()

local fill = colors.cursorline
local inactive_bg = colors.indentline

local inactive = { bg = inactive_bg }

-- TODO: Create global git status count to display for all files in project?
bufferline.setup {
   options = {
      numbers = "both",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
   },
   highlights = {
   --    -- see :h bufferline-highlights
      fill = {
         bg = fill,
      },
      background = inactive,
      diagnostic = inactive,
      error = inactive,
      error_diagnostic = inactive,
      info = inactive,
      info_diagnostic = inactive,
      modified = inactive,
      numbers = inactive,
      warning = inactive,
      warning_diagnostic = inactive,
      separator = {
         fg = fill,
         bg = inactive_bg,
      },
      separator_visible = {
         fg = fill,
      },
      separator_selected = {
         fg = fill,
      },
   },
}
