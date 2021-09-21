local utils = require("core.utils")
local rc = require("rc")

local map = utils.map
local maps = rc.mappings
local plugin_maps = maps.plugin

local cmd = vim.cmd

local M = {}

-- mappings to be called during initialization
M.misc = function()
   local function behaviour_mappings()
      -- space bar is leader
      map({ "n", "v" }, " ", "<Nop>")

      -- don't copy the replaced text after pasting in visual mode
      map("v", "p", "\"_dP")

      -- allow moving cursor through wrapped lines as default
      map("", "j", "v:count || mode(1)[0:1] == \"no\" ? \"j\" : \"gj\"", {
         expr = true,
      })
      map("", "k", "v:count || mode(1)[0:1] == \"no\" ? \"k\" : \"gk\"", {
         expr = true,
      })

      -- don't yank on cut
      map({ "n", "v" }, "x", "\"_x")
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

   local function user_mappings()

      -- turn off highlighting with ESC
      map("n", maps.no_search_highlight, ":noh <CR>")

      -- for _, map_table in pairs(maps) do
      --    map(unpack(map_table))
      -- end
   end

   behaviour_mappings()
   required_mappings()
   user_mappings()
end

-- plugin related mappings
M.bbye = function()
   local m = plugin_maps.bbye
   map("n", m.delete, ":Bdelete<CR>")
   map("n", m.wipeout, ":Bwipeout<CR>")
end

M.cheatsheet = function()
   local m = plugin_maps.cheatsheet
   map("n", m.default_keys,
       ":lua require('cheatsheet').show_cheatsheet_telescope() <CR>")
   map("n", m.user_keys,
       ":lua require('cheatsheet').show_cheatsheet_telescope{ bundled_cheatsheets = false, bundled_plugin_cheatsheets = false } <CR>")
end

M.comment = function()
   local m = plugin_maps.comment.toggle
   map("n", m, ":CommentToggle <CR>")
   map("v", m, ":CommentToggle <CR>")
end

M.dashboard = function()
   local m = plugin_maps.dashboard
   map("n", m.open, ":Dashboard <CR>")
   map("n", m.bookmarks, ":Telescope marks <CR>") -- DashboardJumpMark fails
   map("n", m.new_file, ":DashboardNewFile <CR>")
   map("n", m.session_load, ":SessionLoad <CR>")
   map("n", m.session_save, ":SessionSave <CR>")
end

M.fugitive = function()
   local m = plugin_maps.fugitive
   local opts = {
      silent = false,
   }
   map("n", m.git, ":Git <CR>")
   map("n", m.git_add, ":G add <CR>")
   map("n", m.git_commit, ":G commit")
   map("n", m.git_blame, ":G blame")
   map("n", m.git_diff, ":G diff <CR>")
   map("n", m.git_diff_split, ":Gdiffsplit <CR>")
   map("n", m.git_edit, ":Gedit HEAD~:%<Left><Left>", opts)
   map("n", m.git_log, ":G log <CR>")
   map("n", m.git_branch, ":Git branch <space>")
   map("n", m.git_checkout, ":Git checkout <space>")
   map("n", m.git_push, ":Dispatch! git push <CR>")
   map("n", m.git_pull, ":Dispatch! git pull <CR>")
end

M.neoformat = function()
   local m = plugin_maps.neoformat.format
   map("n", m, ":Neoformat <CR>")
end

M.subversive = function()
   local m = plugin_maps.subversive
   local opt = {
      noremap = false,
      silent = false,
   }
   -- <plug> doesn't work so use full original command
   map("n", m.substitute,
       ":<c-u>call subversive#singleMotion#preSubstitute(v:register, 0, '')<cr>:set opfunc=subversive#singleMotion#substituteMotion<cr>g@",
       opt)
   map("n", m.substitute_line,
       ":<c-u>call subversive#singleMotion#substituteLineSetup(v:register, v:count)<cr>:set opfunc=subversive#singleMotion#substituteLine<cr>g@l",
       opt)
   map("n", m.substitute_end_of_line,
       ":<c-u>call subversive#singleMotion#substituteToEndOfLineSetup(v:register, v:count)<cr>:set opfunc=subversive#singleMotion#substituteToEndOfLine<cr>g@l",
       opt)
end

M.telescope = function()
   local m = plugin_maps.telescope
   map("n", m.buffers, ":Telescope buffers <CR>")
   map("n", m.find_files, ":Telescope find_files <CR>")
   map("n", m.file_browser, ":Telescope file_browser <CR>")
   map("n", m.git_commits, ":Telescope git_commits <CR>")
   map("n", m.git_status, ":Telescope git_status <CR>")
   map("n", m.live_grep, ":Telescope live_grep <CR>")
   map("n", m.oldfiles, ":Telescope oldfiles <CR>")
   map("n", m.help_tags, ":Telescope help_tags <CR>")
   map("n", m.frecency, ":Telescope frecency <CR>")
end

M.window = function()
   local m = plugin_maps.window.pick
   map("n", m, ":lua require('nvim-window').pick() <CR>")
end

M.zen = function()
   local m = plugin_maps.zen
   map("n", m.ataraxis_mode, ":TZAtaraxis <CR>")
   map("n", m.focus_mode, ":TZFocus <CR>")
   map("n", m.minimalistic_mode, ":TZMinimalist <CR>")
end

return M
