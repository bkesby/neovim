local M = {}

M.better_escape = function()
   vim.g.better_escape_interval = 100
   vim.g.better_escape_shortcut = "jk"
end

return M
