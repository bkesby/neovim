local present, telescope = pcall(require, "telescope")
if not present then
   return
end

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
         -- TODO: Can't confirm flex settings work correctly
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
      border = true,
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      set_env = { COLORTERM = "truecolor", },
      file_ignore_patterns = { "%.pyc", },
   },
}

require("telescope").load_extension("fzf")
