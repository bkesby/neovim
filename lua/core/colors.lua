-- Theme config loaded from plugun config
local present, theme = pcall(require, 'onedarkpro')
if not present then
   return
end

-- Change default style
theme.setup {
   options = {
      cursorline = true,
      transparency = true,
   },
   hlgroups = {
      DiagnosticError = {
         fg = "${red}",
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
      TSFuncMacro = {
         fg = "${red}",
      },
   },
}

theme.load()
