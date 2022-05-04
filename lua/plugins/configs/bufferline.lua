local present, bufferline = pcall(require, "bufferline")
if not present then return end

local colors = require("onedarkpro").get_colors()

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
         guibg = colors.cursorline,
      },
      background = {
         guibg = colors.indentline, 
      },
      numbers = {
         guibg = colors.indentline,
      },
      separator = {
         guifg = colors.cursorline,
         guibg = colors.indentline,
      },
      separator_visible = {
         guifg = colors.cursorline,
      },
      separator_selected = {
         guifg = colors.cursorline,
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
