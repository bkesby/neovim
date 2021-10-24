local present, theme = pcall(require, "onedarkpro")
if not present then return end

local rc = require("rc")

print(rc.ui.somethign)

theme.setup {
   theme = "onedark",
   -- Declare highlight group additions and changes
   hlgroups = {
      FoldColumn = {
         link = "SignColumn",
      },
      StatusLineNC = {
         fg = "${gray}",
         bg = "${bg}",
         style = "strikethrough",
      },
      GitAdd = {
         fg = "${green}",
      },
      GitChange = {
         fg = "${orange}",
      },
      GitDelete = {
         fg = "${red}",
      },
   },
}

theme.load()
