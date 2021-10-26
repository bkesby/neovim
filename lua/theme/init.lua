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
      DiagnosticError = {
         fg = "${red}",
         bg = "${bg}",
      },
      DiagnosticInformation = {
         fg = "${cyan}",
         bg = "${bg}",
      },
      DiagnosticSignError = {
         fg = "${red}",
         bg = "${bg}",
      },
      DiagnosticSignWarning = {
         fg = "${yellow}",
         bg = "${bg}",
      },
      DiagnosticSignHint = {
         fg = "${blue}",
         bg = "${bg}",
      },
      DiagnosticSignInformation = {
         fg = "${cyan}",
         bg = "${bg}",
      },
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
      Identifier = {
         fg = "${red}",
      },
      IndentBlanklineContextChar = {
         fg = "${gray}",
      },
      LspDiagnosticsVirtualTextError = {
         link = "LspDiagnosticsSignError",
      },
      LspDiagnosticsVirtualTextWarning = {
         link = "LspDiagnosticsSignWarning",
      },
      LspDiagnosticsVirtualTextInformation = {
         link = "LspDiagnosticsSignInformation",
      },
      LspDiagnosticsVirtualTextHint = {
         link = "LspDiagnosticsSignHint",
      },
      StatusLineNC = {
         fg = "${indentline}",
         bg = "${bg}",
         style = "strikethrough",
      },
      -- TSField = {
      --    fg = "${highlight}",
      -- },
   },
}

theme.load()
