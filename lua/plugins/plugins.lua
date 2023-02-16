return {
  -- Themes
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("plugins.configs.onedarkpro") end,
  },

  -- Lua core
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  -- Pope core
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-sleuth", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },

  -- UI
  {"feline-nvim/feline.nvim"},

  -- Treesitter

  -- Git
  { "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gsplit", "Gread", "Gedit" },
    init = function() require("core.mappings").fugitive() end,
    dependencies = { "tpope/vim-rhubarb" },
  },
  { "lewis6991/gitsigns.nvim",
    config = function() require("plugins.configs.gitsigns") end,
  },
}
