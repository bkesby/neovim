local opt = vim.opt
local g = vim.g

local rc = require("rc").options

g.mapleader = " "

-- General Options {{{
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"
opt.autoread = rc.autoread
opt.clipboard = rc.clipboard
opt.mouse = rc.mouse -- Mouses are for pussys
opt.hidden = rc.hidden
opt.iskeyword:append "-" -- Hypened words count as single word
--opt.formatoptions:remove "cro" -- Not working??
opt.errorbells = false
-- Timings {{{
opt.updatetime = rc.updatetime
opt.timeout = rc.timeout
opt.timeoutlen = rc.timeoutlen
opt.ttimeoutlen = rc.ttimeoutlen
-- }}}
-- }}}
-- Behaviour {{{
opt.splitbelow = rc.splitbelow
opt.splitright = rc.splitright
opt.whichwrap:append "<>hl" -- Move to next line when cursor reaches end
opt.backspace = "eol,start,indent" -- Natural backspace
opt.wildignorecase = rc.wildignorecase
-- }}}
-- UI {{{
opt.termguicolors = rc.termguicolors
opt.cmdheight = rc.cmdheight
opt.cul = rc.cursorline
opt.signcolumn = rc.signcolumn
opt.foldcolumn = rc.foldcolumn
opt.laststatus = rc.laststatus
opt.showmode = rc.showmode
-- opt.pumheight = rc.pumheight
opt.scrolloff = rc.scrolloff
opt.emoji = false
-- Wrap {{{
opt.wrap = rc.wrap
opt.linebreak = rc.linebreak
opt.sidescroll = rc.sidescroll
opt.breakindent = rc.breakindent
opt.breakindentopt = rc.breakindentopt
opt.showbreak = rc.showbreak
-- }}}
-- Indentation {{{
opt.expandtab = rc.expandtab
opt.shiftwidth = rc.shiftwidth
opt.tabstop = rc.tabstop
opt.softtabstop = rc.softtabstop
opt.smartindent = rc.smartindent
opt.autoindent = rc.autoindent
opt.shiftround = rc.shiftround
-- }}}
-- Numbers {{{
opt.number = rc.number
opt.numberwidth = rc.numberwidth
opt.relativenumber = rc.relativenumber -- Set with autocmd
opt.ruler = rc.ruler
-- }}}
-- Fills {{{
opt.fillchars:append(rc.fillchars)
opt.listchars = rc.listchars
-- }}}
-- Shortmess {{{
opt.shortmess = rc.shortmess
-- }}}
-- }}}
-- Searching {{{
opt.hlsearch = rc.hlsearch
opt.ignorecase = rc.ignorecase
opt.smartcase = rc.smartcase
opt.incsearch = rc.incsearch
-- }}}
-- Folds {{{
opt.foldmethod = rc.foldmethod
opt.foldlevelstart = rc.foldlevelstart
opt.foldnestmax = rc.foldnestmax
-- }}}
-- Files & Backup {{{
opt.undofile = rc.undofile
opt.history = rc.history
opt.shada = rc.shada
opt.wildignore:append ".pyc,.swp" -- Files to ignore when opeing files based on a glob pattern
-- }}}
-- Environments {{{
g.python_host_prog = vim.fn.expand("$PYENV_ROOT/versions/neovim2/bin/python")
g.python3_host_prog = vim.fn.expand("$PYENV_ROOT/versions/neovim3/bin/python")
-- }}}
-- Builtins {{{
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
-- }}}
