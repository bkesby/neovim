local g = vim.g
local mappings = require("rc").mappings.plugin.dashboard
local telescope = require("rc").mappings.plugin.telescope

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_disable_bufferline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_section = {
   a = {
      description = {
         "  Find File                       " ..
             telescope.find_files:gsub("<leader>", "SPC "),
      },
      command = "Telescope find_files",
   },
   b = {
      description = {
         "  Recents                         " ..
             telescope.frecency:gsub("<leader>", "SPC "),
      },
      command = "Telescope frecency",
   },
   c = {
      description = {
         "ﭨ  Find Word                       " ..
             telescope.live_grep:gsub("<leader>", "SPC "),
      },
      command = "Telescope live_grep",
   },
   d = {
      description = {
         "  New File                        " ..
             mappings.new_file:gsub("<leader>", "SPC "),
      },
      command = "DashboardNewFile",
   },
   e = {
      description = {
         "  Bookmarks                       " ..
             mappings.bookmarks:gsub("<leader>", "SPC "),
      },
      command = "Telescope marks",
   },
   f = {
      description = {
         "  Load Last Session               " ..
             mappings.session_load:gsub("<leader>", "SPC "),
      },
      command = "SessionLoad",
   },
}
-- disable tabline in dashboard
-- vim.cmd [[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]
