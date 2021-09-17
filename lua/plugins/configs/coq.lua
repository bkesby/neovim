local M = {}

M.setup = function()
   vim.g.coq_settings = { auto_start = "shut-up", }
end

M.config = function()
   local present, coq = pcall(require, "coq")
   if not present then
      return
   end
end

return M
