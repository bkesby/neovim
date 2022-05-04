local present, bufferline = pcall(require, "bufferline")
if not present then return end

local colors = require("onedarkpro").get_colors()

local fill = colors.cursorline
local inactive_bg = colors.indentline

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
      background = {
         guibg = inactive_bg, 
      },
      numbers = {
         guibg = inactive_bg,
      },
      modified = {
         guibg = inactive_bg,
      },
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
   --    error_selected = {
   --       guifg = error_color,
   --    },
   --    warning_selected = {
   --       guifg = warn_color,
   --    },
   --    info_selected = {
   --       guifg = info_color,
   --    },
   },
}
