local present, telescope = pcall(require, "telescope")
if not present then return end

local actions = require("telescope.actions")

local actions = require("telescope.actions")

telescope.setup {
   defaults = {
      prompt_prefix = " ❯ ",
      selection_caret = "❱ ",
      entry_prefix = "  ",
      initial_mode = "insert",
      sorting_strategy = "ascending",
      selection_strategy = "reset",
      scroll_strategy = "cycle",
      path_display = { "smart" },
      layout_stategy = "flex",
      layout_config = {
         flex = {
            height = 0.8,
            width = 0.85,
            scroll_speed = 5,
         },
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         width = 0.85,
         height = 0.80,
      },
      mappings = {
         i = {
            ["<ESC>"] = actions.close,
         },
      },
      border = true,
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      set_env = {
         COLORTERM = "truecolor",
      },
      file_ignore_patterns = { "%.pyc", "__pycache__", "%.lock" },
   },
   pickers = {
      find_files = {
         file_ignore_patterns = { "%.png", "%.jpg", "%.jpeg", "__pycache__", "%.lock" },
      },
   },
   extensions = {
      frecency = {
         show_unindexed = false,
         -- default_workspace = "CWD",
      },
   },
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
require("telescope").load_extension("project")
