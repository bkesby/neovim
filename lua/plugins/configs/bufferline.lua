local present, bufferline = pcall(require, "bufferline")
if not present then return end

local colors = require("onedarkpro").get_colors()

local fill = colors.cursorline
local inactive_bg = colors.indentline

local inactive = { guibg = inactive_bg }

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
         guibg = fill,
      },
      background = inactive,
      diagnostic = inactive,
      error = inactive,
      info = inactive,
      info_diagnostic = inactive,
      modified = inactive,
      numbers = inactive,
      warning = inactive,
      warning_diagnostic = inactive,
      separator = {
         guifg = fill,
         guibg = inactive_bg,
      },
      separator_visible = {
         guifg = fill,
      },
      separator_selected = {
         guifg = fill,
      },
   },
}
