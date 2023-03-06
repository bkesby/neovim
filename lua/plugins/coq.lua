return {
  {
    "ms-jpq/coq_nvim",
    lazy = false,
    branch = "coq",
    build = ":silent! COQdeps",
    init = function() require("plugins.configs.coq") end,
    dependencies = {
      "windwp/nvim-autopairs",
      {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
        event = "BufRead",
      },
    },
  },
}
