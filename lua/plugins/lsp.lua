return {
  { "folke/neodev.nvim", lazy = false },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "RishabhRD/nvim-lsputils" },
  { "RishabhRD/popfix" },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function() require("plugins.configs.lspconfig") end,
  },
  {
    "kosayoda/nvim-lightbulb",
    init = function() require("plugins.configs.others").lightbulb() end,
  },
}
