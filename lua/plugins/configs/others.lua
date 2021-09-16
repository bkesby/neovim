local rc = require("rc").options.plugin
local M = {}

M.better_escape = function()
   vim.g.better_escape_interval = rc.better_escape.interval
   vim.g.better_escape_shortcut = rc.better_escape.shortcut
end

return M
