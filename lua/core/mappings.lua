local utils = require("core.utils")
local rc = require("rc")

local map = utils.map
local maps = rc.mappings
local plugin_maps = maps.plugin

local cmd = vim.cmd

local M = {}

-- mappings to be called during initialization
M.misc = function()
   local function default_mappings()
      -- don't copy the replaced text after pasting in visual mode
      map("v", "p", '"_dP')

      -- allow moving cursor through wrapped lines as default
      map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
      map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

      -- turn off highlighting with ESC
      map("n", "<Esc>", ":noh <CR>")

      -- don't yank on cut
      map({ "n", "v" }, "x", '"_x')
   end

   local function required_mappings()
      
      -- add Packer commands because we are not loading it at startup
      cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
      cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
      cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
      cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
      cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
      cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

   end
   default_mappings()
   required_mappings()
end

-- plugin related mappings
M.comment = function()
   local m = plugin_maps.comment.toggle
   map("n", m, ":CommentToggle <CR>")
   map("v", m, ":CommentToggle <CR>")
end

return M
