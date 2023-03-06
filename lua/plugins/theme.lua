return {
  { -- Colourscheme (must be top priority)
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = require("onedarkpro")
      theme.setup {
        options = {
          cursorline = true,
          transparency = true,
        },
      }
      theme.load()
    end,
  },

  { -- Status Bar
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function() require("plugins.configs.statusline") end,
  },

  { -- Buffer Top Bar
    "akinsho/bufferline.nvim",
    event = "BufNew",
    init = function() require("core.mappings").bufferline() end,
    config = function() require("plugins.configs.bufferline") end,
  },

  { -- Scroll Bar
    "dstein64/nvim-scrollview",
    lazy = false,
    init = function() require("plugins.configs.others").scrollview() end,
  },

  -- Extra UI
  { -- blankline indent
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function() require("plugins.configs.others").blankline() end,
  },

  { -- Add colour reference at declaration
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function() require("plugins.configs.others").colorizer() end,
  },

  { -- Smooth scrolling
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function() require("plugins.configs.others").neoscroll() end,
  },
  
  { -- Show evidence of mouse movement
    "edluffy/specs.nvim",
    config = function() require("plugins.configs.others").specs() end,
  },

  { -- Enter Zen mode
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    init = function() require("core.mappings").zen() end,
    config = function() require("plugins.configs.zen") end,
  },
}
