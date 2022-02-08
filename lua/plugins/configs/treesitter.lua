local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then return end

treesitter.setup {
   ensure_installed = { "css", "elm", "html", "javascript", "lua", "python", "rust", "json", "toml", "rst", "svelte" },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   indent = {
      enable = false,
   },
   autotag = {
      enable = true,
   },
   textsubjects = {
      enable = true,
      keymaps = {
         ["."] = "textsubjects-smart",
         [";"] = "textsubjects-container-outer",
      },
   },
   textobjects = {
      select = {
         enable = true,
         lookahead = true,
         keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
         },
      },
   },
}
