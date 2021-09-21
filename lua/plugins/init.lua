local present, packer = pcall(require, "plugins.packerinit")

if not present then
   return false
end

-- stop linting errors
local use = packer.use

return packer.startup(function()
   local plugin_status = require("rc").plugin_status

   -- plugin manager
   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   -- Neocore
   use { "nvim-lua/plenary.nvim" }
   use { "nvim-lua/popup.nvim" }

   -- core (the pope)
   use { "tpope/vim-abolish" } -- abbreviations, substitusion and coercion
   use { "tpope/vim-unimpaired" } -- bracket mappings
   use { "tpope/vim-repeat" } -- adds repeats for plugins
   -- use { "tpope/vim-sleuth" } -- shift/tab width detection
   use { "machakann/vim-sandwich" } -- surround stuff with motion
   use {
      "svermeulen/vim-subversive",
      setup = function()
         require("core.mappings").subversive()
      end,
   }

   -- text objects
   use { "kana/vim-textobj-user" }
   use { "glts/vim-textobj-comment" }
   use { "michaeljsmith/vim-indent-object" }
   use { "chaoren/vim-wordmotion" }

   -- UI initializing
   use {
      "norcalli/nvim-base16.lua",
      as = "base16",
      after = "packer.nvim",
      config = function()
         require("colors").init()
      end,
   }

   use {
      "hoob3rt/lualine.nvim",
      after = "base16",
      requires = {
         "kyazdani42/nvim-web-devicons",
         opt = true,
      },
      config = function()
         require("plugins.configs.statusline")
      end,
   }

   -- dashboard

   use {
      "glepnir/dashboard-nvim",
      disable = not plugin_status.dashboard,
      config = function()
         require("plugins.configs.dashboard")
      end,
      setup = function()
         require("core.mappings").dashboard()
      end,
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      disable = not plugin_status.treesitter,
      event = "BufRead",
      config = function()
         require("plugins.configs.treesitter")
      end,
      run = ":TSUpdate",
   }

   -- autocompletion (required for lsp config)
   use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "UIEnter",
      setup = function()
         require("plugins.configs.coq").setup()
         -- require("core.utils").lazy_load("coq")
      end,
      -- config = function()
      --    require("plugins.configs.coq").config()
      -- end,
      run = ":silent! COQdeps",
   }

   use {
      "ms-jpq/coq.artifacts",
      as = "artifacts",
      branch = "artifacts",
      event = "InsertEnter",
   }

   -- lsp
   use {
      "kabouzeid/nvim-lspinstall",
      opt = true,
      after = "coq_nvim",
   }

   use {
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function()
         require("plugins.configs.lspconfig")
      end,
   }

   -- formatting

   use {
      "sbdchd/neoformat",
      disable = not plugin_status.neoformat,
      cmd = "Neoformat",
      setup = function()
         require("core.mappings").neoformat()
      end,
      config = function()
         require("plugins.configs.neoformat")
      end,
   }

   -- misc

   use {
      "ethanholz/nvim-lastplace",
      disable = not plugin_status.lastplace,
      config = function()
         require("plugins.configs.others").lastplace()
      end,
   }

   use {
      "jiangmiao/auto-pairs",
      disable = not plugin_status.autopairs,
      event = "BufEnter",
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      disable = not plugin_status.blankline,
      event = "BufRead",
      config = function()
         require("plugins.configs.others").blankline()
      end,
   }

   use {
      "jdhao/better-escape.vim",
      disable = not plugin_status.better_escape,
      event = "InsertEnter",
      setup = function()
         require("plugins.configs.others").better_escape()
      end,
   }

   use {
      "moll/vim-bbye",
      opt = true,
      cmd = { "Bdelete", "Bwipeout" },
      setup = function()
         require("core.mappings").bbye()
      end,
   }

   use {
      "terrortylor/nvim-comment",
      disable = not plugin_status.comment,
      cmd = "CommentToggle",
      config = function()
         require("plugins.configs.others").comment()
      end,
      setup = function()
         require("core.mappings").comment()
      end,
   }

   use {
      "karb94/neoscroll.nvim",
      disable = not plugin_status.neoscroll,
      opt = true,
      config = function()
         require("plugins.configs.others").neoscroll()
      end,
      setup = function()
         require("core.utils").lazy_load("neoscroll.nvim")
      end,
   }

   use {
      "https://gitlab.com/yorickpeterse/nvim-window",
      disable = not plugin_status.window,
      config = function()
         require("plugins.configs.others").window()
      end,
      setup = function()
         require("core.mappings").window()
      end,
   }

   use {
      "Pocco81/TrueZen.nvim",
      disable = not plugin_status.zen,
      cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
      config = function()
         require("plugins.configs.zen")
      end,
      setup = function()
         require("core.mappings").zen()
      end,
   }

   -- telescope
   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "cheatsheet", -- cheatsheet not activated by telescope command
      config = function()
         require("plugins.configs.telescope")
      end,
      setup = function()
         require("core.mappings").telescope()
      end,
      requires = {
         {
            "sudormrfbin/cheatsheet.nvim",
            disable = not plugin_status.cheatsheet,
            after = "telescope.nvim",
            config = function()
               require "plugins.configs.cheatsheet"
            end,
            setup = function()
               require("core.mappings").cheatsheet()
            end,
         }, {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         }, {
            "nvim-telescope/telescope-frecency.nvim",
            requires = { "tami5/sqlite.lua" },
         },
      },
   }

   -- git
   use {
      "tpope/vim-fugitive",
      disable = not plugin_status.fugitive,
      cmd = { "Git", "Gdiffsplit", "Gsplit", "Gread", "Gedit" },
      setup = function()
         require("core.mappings").fugitive()
      end,
   }

   use {
      "lewis6991/gitsigns.nvim",
      disable = not plugin_status.gitsigns,
      opt = true,
      config = function()
         require("plugins.configs.gitsigns")
      end,
      setup = function()
         require("core.utils").lazy_load("gitsigns.nvim")
      end,
   }

   -- scratchpad
   use {
      "metakirby5/codi.vim",
      disable = not plugin_status.codi,
      cmd = "Codi",
      config = function()
         require("plugins.configs.others").codi()
      end,
      -- TODO: Add mappings.
   }

   -- file manager
   use {
      "ms-jpq/chadtree",
      disable = not plugin_status.chadtree,
      branch = "chad",
      cmd = "CHADopen",
      run = ":CHADdeps",
   }

end)
