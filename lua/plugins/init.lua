local present, packer = pcall(require, "plugins.packerinit")

if not present then
   return false
end

-- stop linting errors
local use = packer.use

return packer.startup(function()

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   use {
      "projekt0n/github-nvim-theme",
      after = "packer.nvim",
      config = function()
         require("plugins.configs.colors")
      end,
   }

   use {
      "jdhao/better-escape.vim",
      event = "InsertEnter",
      setup = function()
         require("plugins.configs.others").better_escape()
      end,
   }

end)
