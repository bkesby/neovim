local utils = require("core.utils")
local rc = require("rc")

local map = utils.map
local user_maps = rc.mappings.user
local plugin_maps = rc.mappings.plugin

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
      map("n", user_maps.no_search_highlight, ":noh <CR>")
      -- Move jumplist controls
      map("n", user_maps.prev_jump_position, "<C-o>zz")
      map("n", user_maps.next_jump_position, "<C-i>zz")
      -- Make arrow keys useful
      map("n", user_maps.increase_window_height, "<C-w>5+")
      map("n", user_maps.decrease_window_height, "<C-w>5-")
      map("n", user_maps.increase_window_width, "<C-w>5>")
      map("n", user_maps.decrease_window_width, "<C-w>5<")
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

M.bufferline = function()
   local m = plugin_maps.bufferline
   local opts = {
      noremap = false,
   }
   map("n", m.cycle_next, ":BufferLineCycleNext<CR>", opts)
   map("n", m.cycle_prev, ":BufferLineCyclePrev<CR>", opts)
   map("n", m.move_next, ":BufferLineMoveNext<CR>")
   map("n", m.move_prev, ":BufferLineMovePrev<CR>")
   map("n", m.sort_extension, ":BufferLineSortByExtension<CR>")
   map("n", m.sort_directory, ":BufferLineSortByDirectory<CR>")
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
   map("n", m, ":CommentToggle<CR>")
   map("v", m, ":CommentToggle<CR>")
end

M.dashboard = function()
   local m = plugin_maps.dashboard
   map("n", m.open, ":Dashboard<CR>")
   map("n", m.bookmarks, ":Telescope marks<CR>") -- DashboardJumpMark fails
   map("n", m.new_file, ":DashboardNewFile<CR>")
   map("n", m.session_load, ":SessionLoad<CR>")
   map("n", m.session_save, ":SessionSave<CR>")
end

M.dap = function()
   local m = plugin_maps.dap
   map("n", m.toggle_breakpoint, ":lua require'dap'.toggle_breakpoint()<CR>")
   map("n", m.launch_and_resume, ":lua require'dap'.continue()<CR>")
   map("n", m.step_over, ":lua require'dap'.step_over()<CR>")
   map("n", m.step_into, ":lua require'dap'.step_into()<CR>")
   map("n", m.launch_repl, ":lua require'dap'.repl.open()<CR>")
end

M.fugitive = function()
   local m = plugin_maps.fugitive
   local opts = {
      silent = false,
   }
   map("n", m.git_status, ":Git <CR>")
   map("n", m.git_add, ":Git add %<CR>")
   map("n", m.git_commit, ":Git commit<CR>")
   map("n", m.git_blame, ":Git blame")
   map("n", m.git_diff, ":Git diff <CR>")
   map("n", m.git_diff_split, ":Gdiffsplit <CR>")
   map("n", m.git_diff_get_left, ":diffget //3 <CR>")
   map("n", m.git_diff_get_right, ":diffget //2 <CR>")
   map("n", m.git_edit, ":Gedit HEAD~:%<Left><Left>", opts)
   map("n", m.git_log, ":Git log <CR>")
   map("n", m.git_branch, ":Git branch <space>")
   map("n", m.git_checkout, ":Git checkout <space>")
   map("n", m.git_push, ":Git push <CR>")
   map("n", m.git_pull, ":Git pull <CR>")
end

M.harpoon = function()
   local m = plugin_maps.harpoon
   map("n", m.add_file, ":lua require('harpoon.mark').add_file()<CR>")
   map("n", m.toggle_quick_menu,
       ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
   map("n", m.navigate_to_file_1, ":lua require('harpoon.ui').nav_file(1)<CR>")
   map("n", m.navigate_to_file_2, ":lua require('harpoon.ui').nav_file(2)<CR>")
   map("n", m.navigate_to_file_3, ":lua require('harpoon.ui').nav_file(3)<CR>")
   map("n", m.navigate_to_file_4, ":lua require('harpoon.ui').nav_file(4)<CR>")
   map("n", m.navigate_to_file_5, ":lua require('harpoon.ui').nav_file(5)<CR>")
   map("n", m.navigate_to_file_6, ":lua require('harpoon.ui').nav_file(6)<CR>")
   map("n", m.navigate_to_file_7, ":lua require('harpoon.ui').nav_file(7)<CR>")
   map("n", m.navigate_to_file_8, ":lua require('harpoon.ui').nav_file(8)<CR>")
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

M.todo = function()
   local m = plugin_maps.todo
   map("n", m.search_with_telescope, ":TodoTelescope<CR>")
end

M.undo = function()
   local m = plugin_maps.undo.toggle_undo_tree
   map("n", m, ":UndotreeToggle<CR>")
end

M.window = function()
   local m = plugin_maps.window.pick_window
   map("n", m, ":lua require('nvim-window').pick() <CR>")
end

M.zen = function()
   local m = plugin_maps.zen
   map("n", m.ataraxis_mode, ":TZAtaraxis <CR>")
   map("n", m.focus_mode, ":TZFocus <CR>")
   map("n", m.minimalistic_mode, ":TZMinimalist <CR>")
end

return M
