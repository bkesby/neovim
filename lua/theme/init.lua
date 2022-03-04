local present, theme = pcall(require, "onedarkpro")
if not present then return end

local rc = require("rc")

theme.setup {
   theme = function()
      if vim.o.background == "dark" then
         return "onedark"
      else
         return "onelight"
      end
   end,
   options = { cursorline = true },
   -- Declare highlight group additions and changes
   hlgroups = {
      DiagnosticError = { fg = "${red}" },
      -- DiagnosticInformation = { fg = "${cyan}", bg = "${bg}" },
      DiagnosticSignError = { fg = "${red}", bg = "${bg}" },
      DiagnosticSignWarning = { fg = "${yellow}", bg = "${bg}" },
      DiagnosticSignHint = { fg = "${blue}", bg = "${bg}" },
      DiagnosticSignInformation = { fg = "${cyan}", bg = "${bg}" },
      FoldColumn = { link = "SignColumn" },
      GitAdd = { fg = "${green}" },
      GitAddStatus = { fg = "${green}", bg = "${bg_statusline}" },
      GitChange = { fg = "${orange}" },
      GitDelete = { fg = "${red}" },
      Identifier = { fg = "${red}" },
      IndentBlanklineContextChar = { fg = "${gray}" },
      LspDiagnosticsVirtualTextError = { link = "LspDiagnosticsSignError" },
      LspDiagnosticsVirtualTextWarning = { link = "LspDiagnosticsSignWarning" },
      LspDiagnosticsVirtualTextInformation = {
         link = "LspDiagnosticsSignInformation",
      },
      LspDiagnosticsVirtualTextHint = { link = "LspDiagnosticsSignHint" },
      StatusLineNC = {
         fg = "${indentline}",
         bg = "${bg}",
         style = "strikethrough",
      },
      TSFuncMacro = { fg = "${red}" },
   },
}

theme.load()
