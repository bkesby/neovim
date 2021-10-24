local present, onedark = pcall(require, "onedarkpro")
if not present then return end

local rc = require("rc")

print(rc.ui.theme)

onedark.setup {
   theme = "onedark",
   hlgroups = {
      FoldColumn = {
         link = "SignColumn",
      },
      StatusLineNC = {
         fg = "${comment}",
         bg = "${bg}",
         style = "underline",
      },
   },
}

onedark.load()
