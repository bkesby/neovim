local M = {}

-- TODO: Some sort of git management
-- TODO: Add note taking of some sort/scratchpad

-- UI {{{
M.ui = {
   -- TODO: Load the theme from $HOME base16 file
   -- theme to use from base16
   theme = "atlas",
   -- outrun-dark, horizon, heetch, snazzy
}

M.ui.plugin = {
   -- statusline related
   statusline = {
      theme = "auto",
      -- TODO: Statusline theme should pull colors directly from colors.init.lua
   },
}
-- }}}
-- Options {{{
M.options = {
   -- General
   autoread = true,
   clipboard = "unnamedplus",
   mouse = "",
   hidden = true,
   -- Timings
   updatetime = 1000,
   timeout = true,
   timeoutlen = 400,
   ttimeoutlen = 10,
   -- Behaviour
   splitbelow = true,
   splitright = true,
   wildignorecase = true,
   -- UI
   termguicolors = true,
   cmdheight = 1,
   cursorline = true,
   signcolumn = "yes",
   foldcolumn = "1",
   laststatus = 2,
   showmode = false,
   -- pumheight = 10, -- Change popup menu size
   scrolloff = 5,
   -- Wrap
   wrap = false,
   linebreak = true,
   sidescroll = 4,
   breakindent = true,
   breakindentopt = "shift:2,sbr",
   showbreak = "↳",
   -- Indentation
   expandtab = true,
   shiftwidth = 4,
   tabstop = 4,
   softtabstop = 4,
   smartindent = true,
   autoindent = true,
   shiftround = true,
   -- Numbers
   number = true,
   relativenumber = true,
   numberwidth = 2,
   ruler = true,
   -- Fills
   fillchars = {
      eob = " ",
      vert = "┃",
   },
   listchars = {
      tab = "¦ ",
      nbsp = "·",
      trail = "┈",
      precedes = "«",
      extends = "»",
   },
   -- Vim actions output
   shortmess = {
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
   },
   -- Searching
   hlsearch = true,
   ignorecase = true,
   smartcase = true,
   incsearch = true,
   -- Folds
   foldmethod = "marker",
   foldlevelstart = 0,
   foldnestmax = 2,
   -- Files & Backup
   undofile = true,
   history = 2000,
   shada = {
      "'500", -- previously edited files
      "/1000", -- search item history
      ":1000", -- commandline history
      "<500", -- register history
      "s100", -- max item size (kib)
      "h", -- no hlsearch memory
   },
}
-- }}}
-- Plugin Options{{{
M.options.plugin = {
   better_escape = {
      interval = 125,
      shortcut = "jk",
   },
   neoformat = {
      -- Allow basic formatting without filetype
      basic_format_align = 1,
      basic_format_retab = 1,
      basic_format_trim = 1,
   },
}
-- }}}
-- Mappings {{{
M.mappings = {
   -- Hide search highlights
   no_search_highlight = "<Esc>",
   -- movement
}

M.mappings.plugin = {
   cheatsheet = {
      default_keys = "<leader>dk",
      user_keys = "<leader>uk",
   },
   comment = {
      toggle = "<Leader>/",
   },
   lsp = {
      declaration = "gD",
      definition = "gd",
      hover = "K",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>da",
      remove_workspace_folder = "<leader>dr",
      list_workspace_folders = "<leader>dl",
      type_definition = "<leader>D",
      rename = "<leader>rn",
      code_action = "<leader>ca",
      references = "gr",
      show_line_diagnostics = "<leader>e",
      goto_prev = "[d",
      goto_next = "]d",
      set_loclist = "<leader>q",
      formatting = "<leader>f",
      range_code_action = "<leader>ca",
   },
   neoformat = {
      format = "<leader>nf",
   },
   telescope = {
      buffers = "<leader>fb",
      find_files = "<leader>ff",
      file_browser = "<leader>ft",
      git_commits = "<leader>fc",
      git_status = "<leader>fs",
      live_grep = "<leader>fg",
      oldfiles = "<leader>fo",
      help_tags = "<leader>fh",
      -- themes = "<leader>th",
   },
   window = {
      pick = "<leader>w",
   },
   zen = {
      ataraxis_mode = "<leader>zz", -- centre
      focus_mode = "<leader>zf",
      minimalistic_mode = "<leader>zm",
   },
}
-- }}}
-- Plugin switches {{{
M.plugin_status = {
   autopairs = true,
   better_escape = true,
   chadtree = false,
   cheatsheet = true,
   comment = true,
   neoformat = true,
   neoscroll = true,
   treesitter = true,
   window = true,
   zen = true,
}
-- }}}

return M
