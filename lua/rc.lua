local M = {}

M.ui = {
   -- theme to use from base16
   theme = "onedark",
   -- outrun-dark, horizon, heetch, snazzy
}

M.ui.plugin = {
   -- statusline related
   statusline = {
      theme = "auto",
      -- TODO: Statusline theme should pull colors directly from colors.init.lua
   }
}

M.options = {
   -- General
   autoread = true,
   clipboard = "unnamedplus",
   mouse = "",
   hidden = true,
   timeoutlen = 250,
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
   fillchars = { eob = " ", vert = "┃" },
   listchars = { tab = "¦ ", nbsp = "·", trail = "┈", precedes = "«", extends = "»" },
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
}

M.options.plugin = {
   better_escape = {
      interval = 125,
      shortcut = "jk",
   },
}

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
      toggle = "<Leader>/"
   },
   lsp = {
      declaration = "gD",
      definition = "gd",
      hover = "K",
      implementation = "gi",
      signature_help = "gk",
      add_workspace_folder = "<leader>wwa",
      remove_workspace_folder = "<leader>wwr",
      list_workspace_folders = "<leader>wwl",
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
   telescope = {
      buffers = "<leader>fb",
      find_files = "<leader>ff",
      git_commits = "<leader>fc",
      git_status = "<leader>ft",
      live_grep = "<leader>fg",
      oldfiles = "<leader>fo",
      -- themes = "<leader>th",
   },
   window = {
      pick = "<leader>w",
   },
}

-- enable or disable plugins
M.plugin_status = {
   better_escape = true,
   cheatsheet = true,
   comment = true,
}


return M
