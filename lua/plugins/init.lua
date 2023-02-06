local present, packer = pcall(require, "plugins.packerinit")
if not present then return end

return packer.startup(function(use)
   -- plugin manager
   use { "wbthomason/packer.nvim" }

   -- Neocore
   use { "nvim-lua/plenary.nvim" }
   use { "nvim-lua/popup.nvim" }

   -- core (the pope)
   use { "tpope/vim-abolish" } -- abbreviations, substitusion and coercion
   use { "tpope/vim-repeat" } -- adds repeats for plugins
   use { "tpope/vim-sleuth" } -- shift/tab width detection
   use { "tpope/vim-unimpaired", event = "UIEnter" } -- bracket mappings
   use {
      "machakann/vim-sandwich",
      setup = function() require("plugins.configs.others").sandwich() end,
      config = function() require("core.mappings").sandwich() end,
   } -- surround stuff with motion
   use {
      "ThePrimeagen/harpoon",
      setup = function() require("core.mappings").harpoon() end,
      config = function() require("plugins.configs.others").harpoon() end,
   }
   use { "dstein64/nvim-scrollview", setup = function() require("plugins.configs.others").scrollview() end }
   use {
      "mbbill/undotree",
      setup = function() require("core.mappings").undo() end,
      config = function() require("plugins.configs.others").undo() end,
   }

   -- note taking
   use { "vimwiki/vimwiki", setup = function() require("core.mappings").vimwiki() end }

   -- text objects
   use { "wellle/targets.vim" } -- additional text objects
   use { "kana/vim-textobj-user" }
   use { "glts/vim-textobj-comment", event = "UIEnter" }
   use { "michaeljsmith/vim-indent-object" }
   use { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" }
   use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
   use {
      "chaoren/vim-wordmotion",
      event = "UIEnter",
      setup = function() require("plugins.configs.others").wordmotion() end,
   }

   -- UI initializing
   use {
      "olimorris/onedarkpro.nvim",
      as = "theme",
      after = "packer.nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
      config = function() require("core.colors") end,
   }

   use {
      "feline-nvim/feline.nvim",
      as = "statusline",
      after = "theme",
      config = function() require("plugins.configs.statusline") end,
   }

   use {
      "akinsho/bufferline.nvim",
      after = "statusline",
      config = function() require("plugins.configs.bufferline") end,
      setup = function() require("core.mappings").bufferline() end,
   }

   -- dashboard
   use {
      "glepnir/dashboard-nvim",
      event = "VimEnter",
      config = function() require("plugins.configs.dashboard") end,
      setup = function() require("core.mappings").dashboard() end,
   }

   -- treesitter
   use {
      "nvim-treesitter/nvim-treesitter",
      event = "VimEnter",
      config = function() require("plugins.configs.treesitter") end,
      run = ":TSUpdate",
   }

   -- use { "nvim-treesitter/playground", after = "nvim-treesitter" }

   -- autocompletion (required for lsp config)
   use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      run = ":silent! COQdeps",
      event = "BufEnter",
      setup = function() require("plugins.configs.coq") end,
      requires = { "windwp/nvim-autopairs" },
   }
   use { "ms-jpq/coq.artifacts", as = "artifacts", branch = "artifacts", event = "BufRead" }

   -- lsp
   use { "folke/neodev.nvim" }
   use { "williamboman/nvim-lsp-installer", after = "coq_nvim" }
   use { "RishabhRD/nvim-lsputils", after = "nvim-lsp-installer", requires = { "RishabhRD/popfix" } }
   use { "neovim/nvim-lspconfig", after = "nvim-lsputils", config = function() require("plugins.configs.lspconfig") end }

   use {
      "kosayoda/nvim-lightbulb",
      module = "nvim-lightbulb",
      setup = function() require("plugins.configs.others").lightbulb() end,
   }

   -- formatting
   use {
      "sbdchd/neoformat",
      cmd = "Neoformat",
      setup = function() require("core.mappings").neoformat() end,
      config = function() require("plugins.configs.neoformat") end,
   }

   use { "McAuleyPenney/tidy.nvim", event = "BufWritePre" }

   -- misc
   use { "ethanholz/nvim-lastplace", config = function() require("plugins.configs.others").lastplace() end }

   -- use { "windwp/nvim-ts-autotag", event = "VimEnter" }

   use {
      "lukas-reineke/indent-blankline.nvim",
      event = "VimEnter",
      config = function() require("plugins.configs.others").blankline() end,
   }

   use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function() require("plugins.configs.others").better_escape() end,
   }

   use {
      "moll/vim-bbye",
      opt = true,
      cmd = { "Bdelete", "Bwipeout" },
      setup = function() require("core.mappings").bbye() end,
   }

   use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function() require("plugins.configs.others").colorizer() end,
   }

   use {
      "terrortylor/nvim-comment",
      cmd = "CommentToggle",
      setup = function() require("core.mappings").comment() end,
      config = function() require("plugins.configs.others").comment() end,
   }

   use {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function() require("plugins.configs.others").neoscroll() end,
      setup = function() require("core.utils").lazy_load("neoscroll.nvim") end,
   }

   use { "edluffy/specs.nvim", config = function() require("plugins.configs.others").specs() end }

   use {
      "folke/todo-comments.nvim",
      event = "BufRead",
      setup = function() require("core.mappings").todo() end,
      config = function() require("plugins.configs.todo") end,
   }

   use {
      "https://gitlab.com/yorickpeterse/nvim-window",
      config = function() require("plugins.configs.others").window() end,
      setup = function() require("core.mappings").window_select() end,
   }

   use { "sindrets/winshift.nvim", setup = function() require("core.mappings").window_move() end }

   use {
      "Pocco81/TrueZen.nvim",
      cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
      config = function() require("plugins.configs.zen") end,
      setup = function() require("core.mappings").zen() end,
   }

   -- telescope
   use {
      "nvim-telescope/telescope.nvim",
      -- cmd = "Telescope",
      -- module = "cheatsheet", -- cheatsheet not activated by telescope command
      config = function() require("plugins.configs.telescope") end,
      setup = function() require("core.mappings").telescope() end,
      requires = {
         {
            "sudormrfbin/cheatsheet.nvim",
            after = "telescope.nvim",
            config = function() require "plugins.configs.cheatsheet" end,
            setup = function() require("core.mappings").cheatsheet() end,
         }, { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
         { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
         { "nvim-telescope/telescope-project.nvim" }, { "nvim-telescope/telescope-file-browser.nvim" },
      },
   }

   -- git
   use {
      "tpope/vim-fugitive",
      cmd = { "Git", "Gdiffsplit", "Gsplit", "Gread", "Gedit" },
      setup = function() require("core.mappings").fugitive() end,
   }

   use { "tpope/vim-rhubarb", after = "vim-fugitive" }

   use {
      "lewis6991/gitsigns.nvim",
      opt = true,
      config = function() require("plugins.configs.gitsigns") end,
      setup = function() require("core.utils").lazy_load("gitsigns.nvim") end,
   }

   -- debugging
   use {
      "mfussenegger/nvim-dap",
      setup = function() require("core.mappings").dap() end,
      config = function() require("plugins.configs.dap") end,
      requires = { "mfussenegger/nvim-dap-python" },
   }

   use {
      "folke/trouble.nvim",
      cmd = { "Trouble", "TroubleToggle" },
      setup = function() require("core.mappings").trouble() end,
   }

   -- TODO: Incorporate with lsp config to not double load on_attach
   -- use {
   --    "simrat39/rust-tools.nvim",
   --    after = "nvim-lspconfig",
   --    config = function() require("plugins.configs.rust_tools") end,
   -- }

   -- terminal
   use {
      "akinsho/toggleterm.nvim",
      opt = true,
      event = "TermEnter",
      keys = "<leader>t",
      config = function() require("plugins.configs.toggleterm") end,
   }

   -- syntax
   use { "cespare/vim-toml", ft = "toml" }

   -- markdown
   -- use {
   --    "iamcco/markdown-preview.nvim",
   --    ft = "markdown",
   --    run = "cd app && npm install",
   --    setup = function()
   --       require("plugins.configs.others").markdown()
   --       require("core.mappings").markdown()
   --    end,
   -- }

   --
   -- AI
   -- use {
   --    "jackMort/ChatGPT.nvim",
   --    requires = { "MuniTanfjim/nui.nvim", "nvim-telescope/telescope.nvim" },
   --    config = function() require("chatgpt").setup() end,
   -- }

   if vim.g.bootstrap then
      print("Packer.bootstrap is set")
      require("packer").sync()
   end
end)
