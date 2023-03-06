return {
  -- Lua core
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  -- Pope core
  { "tpope/vim-abolish", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-sleuth", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },

  { -- treesitter
    "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
    dependencies = {
      "RRethy/nvim-treesitter-textsubjects",
      "nvim-treesitter/nvim-treesitter-textobjects",
    }
  },

  { -- better escape
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function() require("plugins.configs.others").better_escape() end,
  },

  { -- better undo
    "mbbill/undotree",
    lazy = false,
    init = function() require("core.mappings").undo() end,
    config = function() require("plugins.configs.others").undo() end,
  },

  { -- buffer closing
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
    init = function() require("core.mappings").bbye() end,
  },

  { -- automatic commenting 
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    init = function() require("core.mappings").comment() end,
    config = function() require("plugins.configs.others").comment() end,
  },

  { -- surround stuff with motion 
    "machakann/vim-sandwich",
    lazy = false,
    init = function() require("core.mappings").sandwich() end,
    config = function() require("plugins.configs.others").sandwich() end,
  },

  -- text objects
  { "wellle/targets.vim" },
  { "kana/vim-textobj-user" },
  { "glts/vim-textobj-comment" },
  { "michaeljsmith/vim-indent-object" },

  { -- tidy up file
    "McAuleyPenney/tidy.nvim",
    lazy = false,
  },

  { -- Improved `W` key
    "chaoren/vim-wordmotion",
    init = function() require("plugins.configs.others").wordmotion() end,
  },

  { -- Window selection
    "https://gitlab.com/yorickpeterse/nvim-window",
    init = function() require("core.mappings").window_select() end,
    config = function() require("plugins.configs.others").window() end,
  },

  { -- Window shifting
    "sindrets/winshift.nvim",
    init = function() require("core.mappings").window_move() end,
  },

}
   -- -- note taking
   -- use { "vimwiki/vimwiki", setup = function() require("core.mappings").vimwiki() end }
   -- -- dashboard
   -- use {
      -- "glepnir/dashboard-nvim",
      -- event = "VimEnter",
      -- config = function() require("plugins.configs.dashboard") end,
      -- setup = function() require("core.mappings").dashboard() end,
   -- }
   -- -- formatting
   -- CHange this to recommended from Mason github page
   -- use {
      -- "sbdchd/neoformat",
      -- cmd = "Neoformat",
      -- setup = function() require("core.mappings").neoformat() end,
      -- config = function() require("plugins.configs.neoformat") end,
   -- }
   -- -- misc
   -- use { "ethanholz/nvim-lastplace", config = function() require("plugins.configs.others").lastplace() end }
-- 
   -- -- use { "windwp/nvim-ts-autotag", event = "VimEnter" }
-- 
-- 
-- 
   -- use {
      -- "norcalli/nvim-colorizer.lua",
      -- event = "BufRead",
      -- config = function() require("plugins.configs.others").colorizer() end,
   -- }
-- 
-- 
   -- use {
      -- "karb94/neoscroll.nvim",
      -- opt = true,
      -- config = function() require("plugins.configs.others").neoscroll() end,
      -- setup = function() require("core.utils").lazy_load("neoscroll.nvim") end,
   -- }
-- 
   -- use { "edluffy/specs.nvim", config = function() require("plugins.configs.others").specs() end }
-- 
   -- use {
      -- "folke/todo-comments.nvim",
      -- event = "BufRead",
      -- setup = function() require("core.mappings").todo() end,
      -- config = function() require("plugins.configs.todo") end,
   -- }
   -- use {
      -- "Pocco81/TrueZen.nvim",
      -- cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
      -- config = function() require("plugins.configs.zen") end,
      -- setup = function() require("core.mappings").zen() end,
   -- }
   -- -- debugging
   -- use {
      -- "mfussenegger/nvim-dap",
      -- setup = function() require("core.mappings").dap() end,
      -- config = function() require("plugins.configs.dap") end,
      -- requires = { "mfussenegger/nvim-dap-python" },
   -- }
-- 
   -- use {
      -- "folke/trouble.nvim",
      -- cmd = { "Trouble", "TroubleToggle" },
      -- setup = function() require("core.mappings").trouble() end,
   -- }
-- 
   -- -- TODO: Incorporate with lsp config to not double load on_attach
   -- -- use {
   -- --    "simrat39/rust-tools.nvim",
   -- --    after = "nvim-lspconfig",
   -- --    config = function() require("plugins.configs.rust_tools") end,
   -- -- }
-- 
   -- -- terminal
   -- use {
      -- "akinsho/toggleterm.nvim",
      -- opt = true,
      -- event = "TermEnter",
      -- keys = "<leader>t",
      -- config = function() require("plugins.configs.toggleterm") end,
   -- }
-- 
   -- -- syntax
   -- use { "cespare/vim-toml", ft = "toml" }
-- 
   -- -- markdown
   -- -- use {
   -- --    "iamcco/markdown-preview.nvim",
   -- --    ft = "markdown",
   -- --    run = "cd app && npm install",
   -- --    setup = function()
   -- --       require("plugins.configs.others").markdown()
   -- --       require("core.mappings").markdown()
   -- --    end,
   -- -- }
-- 
   -- --
   -- -- AI
   -- -- use {
   -- --    "jackMort/ChatGPT.nvim",
   -- --    requires = { "MuniTanfjim/nui.nvim", "nvim-telescope/telescope.nvim" },
   -- --    config = function() require("chatgpt").setup() end,
   -- -- }
