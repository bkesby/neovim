-- Automatically install packer
local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")

-- bootstrap packer on fresh install
if not present then
   packer_bootstrap = fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
   })
end

-- Autocommand to reload neovim on plugin init file save
cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost init.lua source <afile> | PackerCompile
   augroup end
]]

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
