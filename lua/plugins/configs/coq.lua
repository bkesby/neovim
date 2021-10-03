local M = {}

M.setup = function()
   vim.g.coq_settings = {
      auto_start = "shut-up",
      ["clients.snippets.warn"] = {},
      keymap = {
         jump_to_mark = "<C-j>",
      },
   }
end

return M
