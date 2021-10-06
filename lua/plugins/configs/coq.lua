local fn = vim.fn

local map = require("core.utils").map
local maps = require("rc").mappings.plugin
local settings = require("rc").options.plugin

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
         x_truncate_len = settings.coq.display.x_truncate_len,
         kind_context = settings.coq.display.kind_context,
         source_context = settings.coq.display.source_context,
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
map("i", maps.coq.pum_escape, [[pumvisible() ? "<c-e><esc>" : "<esc>"]], opts)
map("i", maps.coq.pum_cancel, [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], opts)
map("i", maps.coq.pum_next, [[pumvisible() ? "<c-n>" : "<tab>"]], opts)
map("i", maps.coq.pum_previous, [[pumvisible() ? "<c-p>" : "<bs>"]], opts)

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
map("i", maps.coq.pum_select, "v:lua.MUtils.CR()", opts)

MUtils.BS = function()
   if fn.pumvisible() ~= 0 and fn.complete_info({ "mode" }).mode == "eval" then
      return npairs.esc("<c-e>") .. npairs.autopairs_bs()
   else
      return npairs.autopairs_bs()
   end
end
map("i", maps.coq.pum_backspace, "v:lua.MUtils.BS()", opts)
