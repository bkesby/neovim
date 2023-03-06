return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    init = function() require("core.mappings").telescope() end,
    config = function() require("plugins.configs.telescope") end,
    dependencies = {
      { "sudormrfbin/cheatsheet.nvim",
        config = function() require("plugins.configs.cheatsheet") end,
        init = function() require("core.mappings").cheatsheet() end,
      },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-frecency.nvim", dependencies = { "tami5/sqlite.lua" } },
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },
}
