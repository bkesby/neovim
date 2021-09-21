local present, packer = pcall(require, "plugins.packerinit")

if not present then
   return false
end

-- stop linting errors
local use = packer.use

return packer.startup(function()
   local plugin_status = require("rc").plugin_status

   use {"nvim-lua/plenary.nvim"}

   use {"nvim-lua/popup.nvim"}

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   -- Theme collection and initializer
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
      event = "VimEnter",
      setup = function()
         require("plugins.configs.coq").setup()
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
      after = "artifacts",
      setup = function()
         require("core.utils").lazy_load "nvim-lspinstall"
         -- reload current file to activate lsp for it
         vim.defer_fn(function()
            vim.cmd "silent! e %"
         end, 0)
      end,
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
      "tpope/vim-surround",
      disable = not plugin_status.surround,
      opt = true,
      setup = function()
         require("core.utils").lazy_load("vim-surround")
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
      cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
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
         },
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         },
      },
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
