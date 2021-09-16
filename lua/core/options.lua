local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- General Options {{{
opt.clipboard = "unnamedplus"
opt.hidden = true
opt.shortmess:append "sI"
-- }}}
-- UI {{{
opt.cmdheight = 1
opt.cul = true -- cursor line
opt.fillchars = { eob = " " }
-- wrap
opt.wrap = false
opt.sidescroll = 4
opt.breakindent = true
opt.breakindentopt = "shift:2,sbr"
opt.showbreak = "↳"
-- }}}
-- Indentation {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
-- }}}
-- Numbers {{{
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false
-- }}}
-- Folds {{{
opt.foldmethod = "marker"
opt.foldlevelstart = 0
opt.foldnestmax = 2
-- }}}
