local set = vim.opt
local g = vim.g

--
-- General Options {{{
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.autoread = true
set.clipboard = "unnamedplus"
set.mouse = ""
set.hidden = true
set.iskeyword:append "-" -- Hypened words count as single word
-- set.formatoptions:remove "cro" -- Not working??
set.errorbells = false
-- Timings {{{
set.updatetime = 1000
set.timeout = true
set.timeoutlen = 400
set.ttimeoutlen = 10
-- }}}
-- }}}
-- Behaviour {{{
set.splitbelow = true
set.splitright = true
set.whichwrap:append "<>hl" -- Move to next line when cursor reaches end
set.backspace = "eol,start,indent" -- Natural backspace
set.wildignorecase = true
-- }}}
-- UI {{{
set.termguicolors = true
set.cmdheight = 1
set.cul = true
set.signcolumn = "yes"
set.foldcolumn = "1"
set.laststatus = 2
set.showmode = false
set.inccommand = "split"
-- set.pumheight = 10
set.scrolloff = 5
set.emoji = true
-- Wrap {{{
set.wrap = false
set.linebreak = true
set.sidescroll = 1
set.breakindent = true
set.breakindentopt = "shift:2,sbr"
set.showbreak = "↳"
-- }}}
-- Indentation {{{
set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
-- set.smartindent = true
set.autoindent = true
set.shiftround = true
-- }}}
-- Numbers {{{
set.number = true
set.numberwidth = 2
set.relativenumber = true -- Set with autocmd
set.ruler = false
-- }}}
-- Fills {{{
set.fillchars:append({ eob = " ", vert = "┃" })
set.listchars = { tab = "¦ ", nbsp = "·", trail = "┈", precedes = "«", extends = "»" }
-- }}}
-- Shortmess {{{
set.shortmess = {
   -- f = true, -- use (x of N) instead of (file x of N)
   -- i = false, -- use [noeol] instead of Incomplete last line
   -- l = true, -- use xL, xC instead of x lines, x characters
   a = true, -- abbreviate messages (all of above)
   t = true, -- truncate file messages at start
   A = true, -- ignore annoying swap file messages
   o = true, -- file-read message overwrites subsequent
   O = true, -- file-read message overwrites previous
   I = true, -- don't give the intro message when starting :intro
   s = true, -- hide search TOP/BOTTOM messages
   W = true, -- Don't show [w] or written when writing
   T = true, -- truncate non-file messages in middle
   F = true, -- Don't give file info when editing a file
}
-- }}}
-- }}}
-- Searching {{{
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
-- }}}
-- Folds {{{
set.foldmethod = "marker"
set.foldlevelstart = 0
set.foldnestmax = 2
-- }}}
-- Files & Backup {{{
set.undofile = true
set.history = 5000
set.shada =  {
   "'500", -- previously edited files
   "/1000", -- search item history
   ":1000", -- commandline history
   "<500", -- register history
   "s100", -- max item size (kib)
   "h", -- no hlsearch memory
}
set.wildignore:append ".pyc,.swp" -- Files to ignore when opeing files based on a glob pattern
set.sessionoptions:append "globals"
-- }}}
-- Environments {{{
g.python_host_prog = vim.fn.expand("$PYENV_ROOT/versions/pynvim/bin/python")
g.python3_host_prog = vim.fn.expand("$PYENV_ROOT/versions/pynvim/bin/python")
-- }}}
-- Builtins {{{
local disabled_built_ins = {
   "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper", "vimball", "vimballPlugin", "zip", "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do g["loaded_" .. plugin] = 1 end
-- }}}
