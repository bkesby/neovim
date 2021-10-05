local present, bufferline = pcall(require, "bufferline")
if not present then return end

local colors = require("colors").get()
local bg = colors.base01
local error_color = colors.base08
local warn_color = colors.base09
local info_color = colors.base0C
local hint_color = colors.base0E

-- TODO: Create global git status count to display for all files in project?
bufferline.setup {
   options = {
      numbers = "both",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      -- custom_areas = {
      --    right = diagnostics,
      -- },
   },
   highlights = {
      -- see :h bufferline-highlights
      fill = {
         guibg = bg,
      },
      separator = {
         guifg = bg,
      },
      separator_visible = {
         guifg = bg,
      },
      separator_selected = {
         guifg = bg,
      },
      error_selected = {
         guifg = error_color,
      },
      warning_selected = {
         guifg = warn_color,
      },
      info_selected = {
         guifg = info_color,
      },
   },
}
