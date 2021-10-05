local present, gitsigns = pcall(require, "gitsigns")
if not present then return end

gitsigns.setup {
   attach_to_untracked = false,
   sign_priority = 5,
   signs = {
      add = {
         hl = "GitSignsAdd",
         text = "│",
         -- numhl = "GitSignsAddNr",
         -- linehl = "GitSignsAddLn",
      },
      change = {
         hl = "GitSignsChange",
         text = "│",
         -- numhl = "GitSignsChangeNr",
         -- linehl = "GitSignsChangeLn",
      },
      delete = {
         hl = "GitSignsDelete",
         text = "_",
         -- numhl = "GitSignsDeleteNr",
         -- linehl = "GitSignsDeleteLn",
      },
      topdelete = {
         hl = "GitSignsDelete",
         text = "‾",
         -- numhl = "GitSignsDeleteNr",
         -- linehl = "GitSignsDeleteLn",
      },
      changedelete = {
         hl = "GitSignsChange",
         text = "~",
         -- numhl = "GitSignsChangeNr",
         -- linehl = "GitSignsChangeLn",
      },
   },
   status_formatter = nil,
   watch_gitdir = {
      interval = 600,
   },
}
