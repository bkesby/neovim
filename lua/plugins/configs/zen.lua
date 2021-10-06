local present, true_zen = pcall(require, "true-zen")
if not present then return end

true_zen.setup {
   ui = {
      bottom = {
         cmdheight = 1,
         laststatus = 0,
         ruler = false,
         showmode = false,
         showcmd = false,
      },
      top = {
         showtabline = 0,
      },
      left = {
         number = false,
         relativenumber = false,
         signcolumn = "no",
      },
      modes = {
         ataraxis = {
            left_padding = 12,
            right_padding = 12,
            top_padding = 1,
            bottom_padding = 1,
            ideal_writing_area_width = { 60, 100 },
            auto_padding = true,
            keep_default_fold_fillchars = true,
            custom_bg = { "none", 1 },
            bg_configuration = true,
            affected_higroups = {
               -- NonText = {},
               -- FoldColumn = {},
               -- ColorColumn = {},
               -- VertSplit = {},
               -- StatusLine = {},
               -- StatusLineNC = {},
               -- SignColumn = {},
               ScrollView = true,
            },
         },
         focus = {
            margin_of_error = 5,
            focus_method = "experimental",
         },
      },
      integrations = {
         lualine = true,
         scrollview = false,
      },
      misc = {
         on_off_commands = false,
         ui_elements_commands = false,
         cursor_by_mode = false,
      },
   },
}
