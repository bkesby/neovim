local present, statusline = pcall(require, "lualine")
local rc = require("rc").ui.plugin.statusline
if not present then
   return
end

statusline.setup {
   options = {
      theme = rc.theme,
      disabled_filetypes = {"dashboard"},
   },
}
