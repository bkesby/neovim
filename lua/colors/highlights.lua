local cmd = vim.cmd

local colors = require("colors").get()
local theme = colors.name

-- collect the hex values under base16 styling names
local background = colors.base00
local background2 = colors.base01
local selection = colors.base02
local comment = colors.base03
local dark_foreground = colors.base04
local foreground = colors.base05
local light_foreground = colors.base06
local light_background = colors.base07
local variable = colors.base08
local constant = colors.base09
local class = colors.base0A
local string = colors.base0B
local support = colors.base0C
local method = colors.base0D
local keyword = colors.base0E
local tags = colors.base0F

-- command functions
local function fg(group, color) cmd("hi " .. group .. " guifg=" .. color) end
local function bg(group, color) cmd("hi " .. group .. " guibg=" .. color) end
local function fgbg(group, fcolor, bcolor) cmd("hi " .. group .. " guifg=" .. fcolor .. " guibg=" .. bcolor) end

-- Disable cursor line
cmd [[ hi clear CursorLine ]]

-- Comments
fg("Comment", comment)

-- Searching
bg("Search", support)
bg("IncSearch", class)

-- Gutters
fgbg("LineNR", dark_foreground, background)
fgbg("CursorLineNR", constant, background .. " gui=bold")
fgbg("FoldColumn", dark_foreground, background)
bg("SignColumn", background)

-- Statusline
bg("StatusLine", background)
fgbg("StatusLineNC", background2, background)

-- Dividers
fgbg("VertSplit", background2, background)

-- Folds
fgbg("Folded", dark_foreground, background)

-- lsp diagnostics
-- signs + virtual
fg("DiagnosticError", variable)
fg("DiagnosticWarn", constant)
fg("DiagnosticInfo", support)
fg("DiagnosticHint", keyword)

-- Plugins
-- blankline
fg("IndentBlanklineChar", background2)
fg("IndentBlanklineContextChar", comment .. " gui=nocombine")

-- git signs
fgbg("GitSignsAdd", string, background)
fgbg("GitSignsDelete", variable, background)
fgbg("GitSignsChange", constant, background)

-- Theme specifics
if theme == "heetch" then
   fg("SpecialChar", class)
   fg("Delimiter", comment)
   fgbg("FoldColumn", tags, background)
   -- blankline
   fg("IndentBlanklineChar", tags)
   fg("IndentBlanklineContextChar", keyword .. " gui=nocombine")
   -- lsp diagnostics
   -- signs
   fg("DiagnosticSignError", support)
   fg("DiagnosticSignWarn", method)
   fg("DiagnosticSignHint", constant)
   fg("DiagnosticSignInfo", constant)
   -- virtual
   fg("DiagnosticError", support)
   fg("DiagnosticWarn", support)
   fg("DiagnosticInfo", constant)
   fg("DiagnosticHint", support)
   -- git signs
   fgbg("GitSignsAdd", variable, background)
   fgbg("GitSignsDelete", support, background)
   fgbg("GitSignsChange", constant, background)
end
