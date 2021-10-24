local present, theme = pcall(require, "onedarkpro")
if not present then return end

local rc = require("rc")

print(rc.ui.somethign)

theme.setup {
   theme = "onedark",
   options = {
      highlight_cursorline = true, -- enabled only for telescope
   },
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
      IndentBlanklineContextChar = {
         fg = "${gray}",
      },
   },
}

theme.load()
-- vim.opt.cursorline = false -- disabled except for telescope
