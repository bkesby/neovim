local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

local colors = require("colors").get()
local bg = colors.base00

bufferline.setup {
   options = {
      numbers = "both",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
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
      -- buffer_visible = {
      --    guifg = colors.base0F,
      --    guibg = colors.base0D,
      -- },
      -- buffer_selected = {
      --    guifg = colors.base06,
      -- },
   },
}
