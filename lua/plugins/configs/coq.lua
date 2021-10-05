local fn = vim.fn
local map = require("core.utils").map
local npairs = require("nvim-autopairs")

-- COQ setup
vim.g.coq_settings = {
   auto_start = "shut-up",
   ["clients.snippets.warn"] = {},
   keymap = {
      recommended = false,
   },
   display = {
      pum = {
         x_truncate_len = 8,
         kind_context = { " ", " ❯" },
         source_context = { "", " " },
      },
   },
}

-- Autopairs setup
npairs.setup({
   disabled_filetype = { "TelescopePrompt" },
   check_ts = true,
   map_bs = false,
   fast_wrap = {},
})

local opts = {
   expr = true,
}

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
map("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], opts)
map("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], opts)
map("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], opts)
map("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], opts)

-- Global store of functions
_G.MUtils = {}

MUtils.CR = function()
   if fn.pumvisible() ~= 0 then
      if fn.complete_info({ "selected" }).selected ~= -1 then
         return npairs.esc("<c-y>")
      else
         return npairs.esc("<c-e>") .. npairs.autopairs_cr()
      end
   else
      return npairs.autopairs_cr()
   end
end
map("i", "<cr>", "v:lua.MUtils.CR()", opts)

MUtils.BS = function()
   if fn.pumvisible() ~= 0 and fn.complete_info({ "mode" }).mode == "eval" then
      return npairs.esc("<c-e>") .. npairs.autopairs_bs()
   else
      return npairs.autopairs_bs()
   end
end
map("i", "<bs>", "v:lua.MUtils.BS()", opts)
