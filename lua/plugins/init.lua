local present, packer = pcall(require, "plugins.packerinit")

if not present then
   return false
end

-- stop linting errors
local use = packer.use

return packer.startup(function()
   local plugin_status = require('rc').plugin_status

   use {
      "nvim-lua/plenary.nvim",
   }

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   -- Theme collection and initializer
   use {
      "NvChad/nvim-base16.lua",
      after = "packer.nvim",
      config = function()
         require("colors").init()
      end,
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
         require("plugins.configs.treesitter")
      end,
      run = ":TSUpdate",
   }

   -- lsp
   use {
      "kabouzeid/nvim-lspinstall",
      opt = true,
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

   use {
      "jdhao/better-escape.vim",
      disable = not plugin_status.better_escape,
      event = "InsertEnter",
      setup = function()
         require("plugins.configs.others").better_escape()
      end,
   }

   -- misc
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

   -- telescope
   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "cheatsheet", -- cheatsheet not activated by telescope command
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

end)
