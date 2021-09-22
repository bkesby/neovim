local present, term = pcall(require, "toggleterm")
if not present then
   return
end

local mapping = require("rc").mappings.plugin.toggleterm

term.setup {
   open_mapping = mapping.toggle,
   hide_numbers = true,
   shade_terminals = true,
   insert_mappings = false,
   close_on_exit = true,
}

-- terminal keymaps
function _G.set_terminal_keymaps()
   local opts = {
      noremap = true,
   }
   vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
