local present, statusline = pcall(require, "lualine")
local rc = require("rc").ui.plugin.statusline
if not present then
   return
end

statusline.setup {
   options = {
      icons_enabled = true,
      theme = rc.theme,
      component_separators = {
         left = "|",
         right = "|",
      },
      section_separators = {
         left = " ",
         right = " ",
      },
      disabled_filetypes = { "dashboard" },
   },
   inactive_sections = {
      lualine_c = {},
      lualine_x = {},
   },
}
