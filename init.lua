-- Bootstrap Neovim with Lazy if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Necessary to be set before lazy
vim.g.mapleader = " "

-- Setup Lazy with plugins declared in `lua/plugins`
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "onedark" }},
})

-- Load core configuration
local ok, err = pcall(require, "core")
if not ok then error("Error loading core\n\n" .. err) end
