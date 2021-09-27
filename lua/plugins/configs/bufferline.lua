local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

local colors = require("colors").get()

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
         guibg = colors.base01,
      },
      separator = {
         guifg = colors.base01,
      },
      separator_visible = {
         guifg = colors.base01,
      },
      separator_selected = {
         guifg = colors.base01,
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
