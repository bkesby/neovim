local M = {}

M.setup = function()
   vim.g.coq_settings = {
      auto_start = "shut-up",
      ["clients.snippets.warn"] = {},
   }
end

return M
