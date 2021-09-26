local M = {}

-- TODO: Highlight bufferline
-- TODO: Setup htop terminal? < play around
-- TODO: Add scratchpad/notes taking system
-- TODO: Add suggested coq keybindings

-- UI {{{
M.ui = {
   -- TODO: Load the theme from $HOME base16 file
   -- theme to use from base16
   theme = "onedark",
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
   -- Timings
   updatetime = 1000,
   timeout = true,
   timeoutlen = 400,
   ttimeoutlen = 10,
   -- Behaviour
   hidden = true,
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
   sidescroll = 1,
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
-- Plugin Options {{{
M.options.plugin = {
   better_escape = {
      timeout = 125,
      mapping = "jk",
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
   bbye = {
      delete = "<leader>x",
      wipeout = "<leader>X",
   },
   bufferline = {
      cycle_next = "<leader><TAB>",
      cycle_prev = "<leader><S-TAB>",
      move_next = "<leader>bn",
      move_prev = "<leader>bp",
      sort_extension = "<leader>be",
      sort_directory = "<leader>be",
   },
   cheatsheet = {
      default_keys = "<leader>dk",
      user_keys = "<leader>uk",
   },
   comment = {
      toggle = "<Leader>/",
   },
   dashboard = {
      open = "<leader>db",
      bookmarks = "<leader>bm",
      new_file = "<leader>fn",
      session_load = "<leader>l",
      session_save = "<leader>s",
   },
   fugitive = {
      git = "<leader>gg",
      git_add = "<leader>ga",
      git_commit = "<leader>gc",
      git_blame = "<leader>gb",
      git_diff = "<leader>gd",
      git_diff_split = "<leader>gds",
      git_diff_get_l = "<leader>gf",
      git_diff_get_r = "<leader>gh",
      git_edit = "<leader>ge",
      git_log = "<leader>gl",
      git_branch = "<leader>gbr",
      git_checkout = "<leader>go",
      git_push = "<leader>gps",
      git_pull = "<leader>gpl",
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
   subversive = {
      substitute = "s",
      substitute_line = "ss",
      substitute_end_of_line = "S",
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
      frecency = "<leader>fr",
   },
   toggleterm = {
      toggle = "<leader>t",
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
   blankline = true,
   bufferline = false,
   chadtree = false,
   cheatsheet = true,
   codi = false, -- not smooth yet
   colorizer = true,
   comment = true,
   dashboard = true,
   fugitive = true,
   gitsigns = true,
   lastplace = true,
   neoformat = true,
   neoscroll = true,
   surround = true,
   toggleterm = true,
   treesitter = true,
   wordmotion = true,
   window = true,
   zen = true,
}
-- }}}

return M
