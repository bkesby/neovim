local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

vim.g.bootstrap = false

-- bootstrap packer on fresh install
if fn.empty(fn.glob(install_path)) > 0 then
   print("Cloning Packer...")
   vim.g.bootstrap = true
   fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
   })
   print("Packer cloned!")
end

vim.cmd [[packadd packer.nvim]]

local present, packer = pcall(require, "packer")
if not present then return end

-- Initialize packer with custom settings
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float {
            border = "rounded",
         }
      end,
      prompt_border = "rounded",
   },
   git = {
      clone_timeout = 600,
   },
   auto_clean = true,
   compile_on_sync = true,
}

return packer
