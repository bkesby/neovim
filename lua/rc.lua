local M = {}

-- TODO: Add all plugin mappings into here for cheatsheet addition
-- TODO: Complete DAP setup (dap-python, dap-telescope)
-- TODO: Add scratchpad/notes taking system
-- TODO: improve sandwich mapping to stop collision with sentence

-- UI {{{
M.ui = {
   -- TODO: Load the theme from $HOME base16 file
   -- theme to use from base16
   theme = "onedark",
   -- outrun-dark, horizon-dark, heetch, snazzy, solarized-dark
}

M.ui.plugin = {
   -- statusline related
   statusline = {
      theme = "auto",
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
   ruler = false,
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
   harpoon = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
   },
   neoformat = {
      -- Allow basic formatting without filetype
      basic_format_align = 1,
      basic_format_retab = 1,
      basic_format_trim = 1,
   },
   undo = {
      highlight_changed_sign = 0,
      window_layout = 3,
      set_focus_when_toggle = 1,
   },
}
-- }}}
-- Mappings {{{
-- User Mappings {{{
M.mappings = {}
M.mappings.user = {
   -- Hide search highlights
   no_search_highlight = "<Esc>",
   -- Move jumplist to Unimpaired style (free up <TAB>)
   prev_jump_position = "[j",
   next_jump_position = "]j",
   -- Make the arrow keys useful
   increase_window_height = "<UP>",
   decrease_window_height = "<DOWN>",
   increase_window_width = "<RIGHT>",
   decrease_window_width = "<LEFT>",
   -- Focus fold
   focus_on_current_fold = "<leader>zc",
}
-- }}}
-- Plugin Mappings {{{
M.mappings.plugin = {
   bbye = {
      delete = "<leader>x",
      wipeout = "<leader>X",
      delete_all = "<leader><C-x>",
   },
   bufferline = {
      cycle_next = "<TAB>",
      cycle_prev = "<S-TAB>",
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
      open = "<leader>h",
      bookmarks = "<leader>bm",
      new_file = "<leader>fn",
      session_load = "<leader>l",
      session_save = "<leader>s",
   },
   dap = {
      toggle_breakpoint = "<leader>db",
      continue = "<leader>dc",
      step_out = "<leader>dsu",
      step_into = "<leader>dsi",
      step_over = "<leader>dso",
      launch_repl = "<leader>dr",
      test_python_method = "<leader>dtm",
      test_python_class = "<leader>dtc",
      debug_python_selection = "<leader>ds",
   },
   fugitive = {
      git_status = "<leader>gg",
      git_add = "<leader>ga",
      git_commit = "<leader>gc",
      git_blame = "<leader>gb",
      git_diff = "<leader>gd",
      git_diff_split = "<leader>gds",
      git_diff_get_left = "<leader>gf",
      git_diff_get_right = "<leader>gh",
      git_edit = "<leader>ge",
      git_log = "<leader>gl",
      git_branch = "<leader>gbr",
      git_checkout = "<leader>go",
      git_push = "<leader>gps",
      git_pull = "<leader>gpl",
   },
   harpoon = {
      add_file = "<leader>a",
      toggle_quick_menu = "<leader>mm",
      navigate_to_file_1 = "<leader>ma",
      navigate_to_file_2 = "<leader>ms",
      navigate_to_file_3 = "<leader>md",
      navigate_to_file_4 = "<leader>mf",
      navigate_to_file_5 = "<leader>mj",
      navigate_to_file_6 = "<leader>mk",
      navigate_to_file_7 = "<leader>ml",
      navigate_to_file_8 = "<leader>m;",
   },
   lsp = {
      declaration = "gD",
      definition = "gd",
      hover = "K",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>awf",
      remove_workspace_folder = "<leader>rwf",
      list_workspace_folders = "<leader>lwf",
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
      lsp_reference = "<leader>flr",
   },
   todo = {
      search_with_telescope = "<leader>fd",
   },
   toggleterm = {
      toggle = "<leader>t",
   },
   undo = {
      toggle_undo_tree = "<leader>u",
   },
   window = {
      pick_window = "<leader>w",
   },
   zen = {
      ataraxis_mode = "<leader>zz", -- centre
      focus_mode = "<leader>zf",
      minimalistic_mode = "<leader>zm",
   },
}
-- }}} }}}
-- Plugin switches {{{
M.plugin_status = {
   -- autopairs = true,
   bbye = true,
   better_escape = true,
   blankline = true,
   bufferline = true,
   chadtree = false,
   cheatsheet = true,
   codi = false, -- not smooth yet
   colorizer = true,
   comment = true,
   dashboard = true,
   dap = true,
   fugitive = true,
   gitsigns = true,
   harpoon = true,
   lastplace = true,
   neoformat = true,
   neoscroll = true,
   rust_tools = true,
   statusline = true,
   surround = true,
   todo = true,
   toggleterm = true,
   treesitter = true,
   wordmotion = true,
   window = true,
   zen = true,
}
-- }}}

return M
