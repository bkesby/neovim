local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

local colors = require("colors").get()
local bg = colors.base01
local error_color = colors.base08
local warn_color = colors.base09
local info_color = colors.base0C
local hint_color = colors.base0E

-- TODO: Create global git status count to display for all files in project?
local diagnostics = function()
   local result = {}
   local err = vim.lsp.diagnostic.get_count(0, [[Error]])
   local warn = vim.lsp.diagnostic.get_count(0, [[Warning]])
   local info = vim.lsp.diagnostic.get_count(0, [[Information]])
   local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])
   -- Populate result table with counts
   if err ~= 0 then
      table.insert(result, {
         text = "  " .. err,
         guifg = error_color,
      })
   end
   if warn ~= 0 then
      table.insert(result, {
         text = "  " .. warn,
         guifg = warn_color,
      })
   end
   if info ~= 0 then
      table.insert(result, {
         text = "  " .. info,
         guifg = info_color,
      })
   end
   if hint ~= 0 then
      table.insert(result, {
         text = "  " .. hint,
         guifg = hint_color,
      })
   end
   return result
end

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
   },
}
