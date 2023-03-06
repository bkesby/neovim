return {
  { 
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gsplit", "Gread", "Gedit" },
    init = function() require("core.mappings").fugitive() end,
    dependencies = { "tpope/vim-rhubarb" },
  },

  { -- In numberline
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function() require("plugins.configs.gitsigns") end,
  },
}
