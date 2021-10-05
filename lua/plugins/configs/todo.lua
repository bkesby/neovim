local present, todo = pcall(require, "todo-comments")
if not present then return end

todo.setup {
   signs = false,
   highlight = {
      keyword = "fg",
      after = "",
   },
   colors = {
      -- error = { "DiagnosticError" },
      -- warning = { "DiagnosticWarning" },
      info = { "DiagnosticInfo" },
      -- hint = { "DiagnosticHint" },
      default = { "Comment" },
   },
}
