local present, term = pcall(require, "toggleterm")
if not present then return end

local mapping = require("rc").mappings.plugin.toggleterm

term.setup {
   open_mapping = mapping.toggle,
   hide_numbers = true,
   shade_terminals = false,
   insert_mappings = false,
   close_on_exit = true,
}

-- terminal keymaps
function _G.set_terminal_keymaps()
   local map = vim.api.nvim_buf_set_keymap
   local opts = {
      noremap = true,
   }
   map(0, "t", mapping.term.escape, [[<C-\><C-n>]], opts)
   map(0, "t", mapping.term.normal_mode, [[<C-\><C-n>]], opts)
   map(0, "t", mapping.term.insert_exit_toggle, [[<C-\><C-n>:ToggleTerm<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
