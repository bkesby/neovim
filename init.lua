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
  ui = {
    border = "single",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      }
    }
  },
})

-- Load core configuration
local ok, err = pcall(require, "core")
if not ok then error("Error loading core\n\n" .. err) end
