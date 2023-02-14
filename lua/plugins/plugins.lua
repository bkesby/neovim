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
}
