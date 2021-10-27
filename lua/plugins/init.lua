local present, packer = pcall(require, "plugins.packerinit")

if not present then return false end

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
   use { "tpope/vim-repeat" } -- adds repeats for plugins
   use { "wellle/targets.vim" }
   use { -- bracket mappings
      "tpope/vim-unimpaired",
      event = "UIEnter",
   }
   use { "tpope/vim-sleuth" } -- shift/tab width detection
   use {
      "machakann/vim-sandwich",
      disable = not plugin_status.sandwich,
      setup = function() require("plugins.configs.others").sandwich() end,
      config = function() require("core.mappings").sandwich() end,
   } -- surround stuff with motion
   use {
      "svermeulen/vim-subversive",
      disable = not plugin_status.subversive,
      setup = function() require("core.mappings").subversive() end,
   }
   use {
      "ThePrimeagen/harpoon",
      disable = not plugin_status.harpoon,
      setup = function() require("core.mappings").harpoon() end,
      config = function() require("plugins.configs.others").harpoon() end,
   }
   use {
      "dstein64/nvim-scrollview",
      disable = not plugin_status.scrollview,
      setup = function() require("plugins.configs.others").scrollview() end,
   }
   use {
      "mbbill/undotree",
      setup = function() require("core.mappings").undo() end,
      config = function() require("plugins.configs.others").undo() end,
   }

   -- text objects
   use { "kana/vim-textobj-user" }
   use {
      "glts/vim-textobj-comment",
      event = "UIEnter",
   }
   use { "michaeljsmith/vim-indent-object" }
   use {
      "RRethy/nvim-treesitter-textsubjects",
      after = "nvim-treesitter",
   }
   use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
   }
   use {
      "chaoren/vim-wordmotion",
      disable = not plugin_status.wordmotion,
      event = "UIEnter",
      setup = function() require("plugins.configs.others").wordmotion() end,
   }

   -- UI initializing
   use {
      "olimorris/onedarkpro.nvim",
      as = "theme",
      after = "packer.nvim",
      -- config = function() require("onedarkpro").load() end,
      config = function() require("theme") end,
   }

   use {
      "famiu/feline.nvim",
      as = "statusline",
      disable = not plugin_status.statusline,
      after = "theme",
      requires = {
         "kyazdani42/nvim-web-devicons",
         opt = true,
      },
      config = function() require("plugins.configs.statusline") end,
   }

   use {
      "akinsho/bufferline.nvim",
      disable = not plugin_status.bufferline,
      after = "statusline",
      config = function() require("plugins.configs.bufferline") end,
      setup = function() require("core.mappings").bufferline() end,
   }

   -- dashboard

   use {
      "glepnir/dashboard-nvim",
      disable = not plugin_status.dashboard,
      config = function() require("plugins.configs.dashboard") end,
      setup = function() require("core.mappings").dashboard() end,
   }

   -- treesitter
   use {
      "nvim-treesitter/nvim-treesitter",
      disable = not plugin_status.treesitter,
      event = "BufRead",
      config = function() require("plugins.configs.treesitter") end,
      run = ":TSUpdate",
   }

   use {
      "nvim-treesitter/playground",
      after = "nvim-treesitter",
   }

   -- autocompletion (required for lsp config)
   use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      run = ":silent! COQdeps",
      event = "BufEnter",
      setup = function() require("plugins.configs.coq") end,
      requires = { "windwp/nvim-autopairs" },
   }

   -- snippets
   use {
      "ms-jpq/coq.artifacts",
      as = "artifacts",
      branch = "artifacts",
      event = "BufRead",
   }

   -- lsp
   use {
      "williamboman/nvim-lsp-installer",
      after = "coq_nvim",
   }

   use {
      "RishabhRD/nvim-lsputils",
      after = "nvim-lsp-installer",
      requires = { "RishabhRD/popfix" },
   }

   use {
      "neovim/nvim-lspconfig",
      after = "nvim-lsputils",
      config = function() require("plugins.configs.lspconfig") end,
      requires = { "folke/lua-dev.nvim" },
   }

   use {
      "kosayoda/nvim-lightbulb",
      module = "nvim-lightbulb",
      setup = function() require("plugins.configs.others").lightbulb() end,
   }

   -- formatting

   use {
      "sbdchd/neoformat",
      disable = not plugin_status.neoformat,
      cmd = "Neoformat",
      setup = function() require("core.mappings").neoformat() end,
      config = function() require("plugins.configs.neoformat") end,
   }

   -- misc

   use {
      "ethanholz/nvim-lastplace",
      disable = not plugin_status.lastplace,
      config = function() require("plugins.configs.others").lastplace() end,
   }

   use {
      "windwp/nvim-ts-autotag",
      disable = not plugin_status.autotag,
      event = "BufRead",
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      disable = not plugin_status.blankline,
      event = "BufRead",
      config = function() require("plugins.configs.others").blankline() end,
   }

   use {
      "max397574/better-escape.nvim",
      disable = not plugin_status.better_escape,
      event = "InsertEnter",
      config = function() require("plugins.configs.others").better_escape() end,
   }

   use {
      "moll/vim-bbye",
      disable = not plugin_status.bbye,
      opt = true,
      cmd = { "Bdelete", "Bwipeout" },
      setup = function() require("core.mappings").bbye() end,
   }

   use {
      "norcalli/nvim-colorizer.lua",
      disable = not plugin_status.colorizer,
      event = "BufRead",
      config = function() require("plugins.configs.others").colorizer() end,
   }

   use {
      "terrortylor/nvim-comment",
      disable = not plugin_status.comment,
      cmd = "CommentToggle",
      setup = function() require("core.mappings").comment() end,
      config = function() require("plugins.configs.others").comment() end,
   }

   use {
      "karb94/neoscroll.nvim",
      disable = not plugin_status.neoscroll,
      opt = true,
      config = function() require("plugins.configs.others").neoscroll() end,
      setup = function() require("core.utils").lazy_load("neoscroll.nvim") end,
   }

   use {
      "edluffy/specs.nvim",
      disable = not plugin_status.specs,
      config = function() require("plugins.configs.others").specs() end,
   }

   use {
      "folke/todo-comments.nvim",
      disable = not plugin_status.todo,
      event = "BufRead",
      setup = function() require("core.mappings").todo() end,
      config = function() require("plugins.configs.todo") end,
   }

   use {
      "https://gitlab.com/yorickpeterse/nvim-window",
      disable = not plugin_status.window_select,
      config = function() require("plugins.configs.others").window() end,
      setup = function() require("core.mappings").window_select() end,
   }

   use {
      "sindrets/winshift.nvim",
      disable = not plugin_status.window_move,
      setup = function() require("core.mappings").window_move() end,
   }

   use {
      "Pocco81/TrueZen.nvim",
      disable = not plugin_status.zen,
      cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
      config = function() require("plugins.configs.zen") end,
      setup = function() require("core.mappings").zen() end,
   }

   -- telescope
   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "cheatsheet", -- cheatsheet not activated by telescope command
      config = function() require("plugins.configs.telescope") end,
      setup = function() require("core.mappings").telescope() end,
      requires = {
         {
            "sudormrfbin/cheatsheet.nvim",
            disable = not plugin_status.cheatsheet,
            after = "telescope.nvim",
            config = function() require "plugins.configs.cheatsheet" end,
            setup = function() require("core.mappings").cheatsheet() end,
         }, {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         }, {
            "nvim-telescope/telescope-frecency.nvim",
            requires = { "tami5/sqlite.lua" },
         }, { "nvim-telescope/telescope-project.nvim" },
      },
   }

   -- git
   use {
      "tpope/vim-fugitive",
      disable = not plugin_status.fugitive,
      cmd = { "Git", "Gdiffsplit", "Gsplit", "Gread", "Gedit" },
      setup = function() require("core.mappings").fugitive() end,
   }

   use {
      "tpope/vim-rhubarb",
      disable = not plugin_status.fugitive,
      after = "vim-fugitive",
   }

   use {
      "lewis6991/gitsigns.nvim",
      disable = not plugin_status.gitsigns,
      opt = true,
      config = function() require("plugins.configs.gitsigns") end,
      setup = function() require("core.utils").lazy_load("gitsigns.nvim") end,
   }

   -- debugging
   use {
      "mfussenegger/nvim-dap",
      disable = not plugin_status.dap,
      -- TODO: Work out lazyload trigger -- only on breakpoint set or continue()
      setup = function() require("core.mappings").dap() end,
      config = function() require("plugins.configs.dap") end,
      requires = { "mfussenegger/nvim-dap-python" },
   }

   use {
      "folke/trouble.nvim",
      cmd = { "Trouble", "TroubleToggle" },
      setup = function() require("core.mappings").trouble() end,
   }

   use {
      "simrat39/rust-tools.nvim",
      disable = not plugin_status.rust_tools,
      after = "nvim-lspconfig",
      -- ft = "rust",
      config = function() require("plugins.configs.rust_tools") end,
   }

   -- terminal
   use {
      "akinsho/toggleterm.nvim",
      opt = true,
      event = "TermEnter",
      keys = "<leader>t",
      config = function() require("plugins.configs.toggleterm") end,
   }

   -- syntax
   use {
      "cespare/vim-toml",
      ft = "toml",
   }

   -- markdown
   use {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      run = "cd app && npm install",
      setup = function()
         require("plugins.configs.others").markdown()
         require("core.mappings").markdown()
      end,
   }
   use {
      "ellisonleao/glow.nvim",
      disable = not plugin_status.glow,
      cmd = "Glow",
      setup = function() require("core.mappings").glow() end,
   }

   -- scratchpad
   use {
      "metakirby5/codi.vim",
      disable = not plugin_status.codi,
      cmd = "Codi",
      config = function() require("plugins.configs.others").codi() end,
   }

   -- file manager
   use {
      "ms-jpq/chadtree",
      disable = not plugin_status.chadtree,
      branch = "chad",
      cmd = "CHADopen",
      run = ":silent! CHADdeps",
   }

end)
