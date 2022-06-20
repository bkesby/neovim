local db = require('dashboard')
local dashboard = require("maps").plugin.dashboard
local telescope = require("maps").plugin.telescope

-- db.dashboard_disable_at_vimenter = 0
db.hide_statusline = true
db.hide_tabline = true
db.dashboard_default_executive = "telescope"

db.custom_header = {
   "                                                       ", "                                                       ",
   "                                                       ", "                                                       ",
   "                                                       ", "                                                       ",
   " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
   " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
   " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
   " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
   " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
   " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
   "                                                       ", "                                                       ",
   "                                                       ", "                 Customised by Kesby                   ",
   "                                                       ", "                                                       ",
   "                                                       ",
}
-- disable tabline in dashboard
-- vim.cmd [[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]

db.custom_center = {
   {
      icon = " ",
      desc = "Find File                            ",
      shortcut = telescope.find_files:gsub("<leader>", "SPC "),
      action = "Telescope find_files",
   },
   {
      icon = " ",
      desc = "Recents                              ",
      shortcut = telescope.frecency:gsub("<leader>", "SPC "),
      action = "Telescope frecency",
   },
   {
      icon = " ",
      desc = "Find Word                            ",
      shortcut = telescope.live_grep:gsub("<leader>", "SPC "),
      action = "Telescope live_grep",
   },
   {
      icon = " ",
      desc = "Find Project                         ",
      shortcut = telescope.find_projects:gsub("<leader>", "SPC "),
      action = "Telescope project",
   },
   {
      icon = " ",
      desc = "New File                             ",
      shortcut = dashboard.new_file:gsub("<leader>", "SPC "),
      action = "DashboardNewFile",
   },
   {
      icon = " ",
      desc = "Bookmarks                            ",
      shortcut = dashboard.bookmarks:gsub("<leader>", "SPC "),
      action = "Telescope marks",
   },
   {
      icon = " ",
      desc = "Load Last Session                    ",
      shortcut = dashboard.session_load:gsub("<leader>", "SPC "),
      action = "Telescope SessionLoad",
   },
   {
      icon = " ",
      desc = "Help                                 ",
      shortcut = telescope.help_tags:gsub("<leader>", "SPC "),
      action = "Telescope help_tags",
   },
}
