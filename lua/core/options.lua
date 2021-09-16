local opt = vim.opt
local g = vim.g

local options = require("rc").options

g.mapleader = " "

-- General Options {{{
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"
opt.autoread = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.mouse = "" -- Mouses are for pussys
opt.hidden = true
opt.timeoutlen = 200
opt.iskeyword:append "-" -- Hypened words count as single word
--opt.formatoptions:remove "cro" -- Not working??
-- }}}
-- Behaviour {{{
opt.splitbelow = true
opt.splitright = true
opt.whichwrap:append "<>hl" -- Move to next line when cursor reaches end
opt.backspace = "eol,start,indent" -- Natural backspace
-- }}}
-- UI {{{
opt.cmdheight = 2
opt.cul = true -- cursor line
opt.signcolumn = "yes"
opt.foldcolumn = "1"
opt.laststatus = 2
opt.showmode = false
opt.pumheight = 10 -- Change popup menu size
opt.shortmess:append "sI" -- Disable intro
opt.scrolloff = 5
-- Wrap {{{
opt.wrap = false
opt.linebreak = true
opt.sidescroll = 4
opt.breakindent = true
opt.breakindentopt = "shift:2,sbr"
opt.showbreak = "↳"
-- }}}
-- Indentation {{{
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.shiftround = true
-- }}}
-- Numbers {{{
opt.number = true
opt.numberwidth = 2
--opt.relativenumber = true -- Set with autocmd
opt.ruler = true
-- }}}
-- Fills {{{
opt.fillchars:append { eob = " ", vert = "┃" } -- remove tilde from end of files
opt.listchars = { tab = "¦ ", nbsp = "·", trail = "┈", precedes = "«", extends = "»" }
-- }}}
-- }}}
-- Searching {{{
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- }}}
-- Folds {{{
opt.foldmethod = "marker"
opt.foldlevelstart = 0
opt.foldnestmax = 2
-- }}}
-- Files & Backup {{{
opt.undofile = true
opt.wildignore:append ".pyc,.swp" -- Files to ignore when opeing files based on a glob pattern
-- }}}
