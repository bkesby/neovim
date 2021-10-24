local present, theme = pcall(require, "onedarkpro")
if not present then return end

local rc = require("rc")

theme.setup {
   theme = "onedark",
   options = {
      highlight_cursorline = true,
   },
   -- Declare highlight group additions and changes
   hlgroups = {
      FoldColumn = {
         link = "SignColumn",
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
      StatusLineNC = {
         fg = "${gray}",
         bg = "${bg}",
         style = "strikethrough",
      },
      -- TSField = {
      --    fg = "${highlight}",
      -- },
   },
}

theme.load()
