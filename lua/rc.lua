local M = {}

M.ui = {
   -- theme to use from base16
   theme = "onedark"
}

M.mappings = {

}

M.mappings.plugin = {
   cheatsheet = {
      default_keys = "<leader>dk",
      user_keys = "<leader>uk",
   },
   comment = {
      toggle = "<Leader>/"
   },
}

M.options = {
   -- General
   autoread = true,
   clipboard = "unnamedplus",
   mouse = "",
   hidden = true,
   timeoutlen = 200,
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
   pumheight = 10, -- Change popup menu size
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
      interval = 100,
      shortcut = "jk",
   },
}

-- enable or disable plugins
M.plugin_status = {
   better_escape = true,
   cheatsheet = true,
   comment = true,
}


return M
