local g = vim.g
local rc = require("rc").options.plugin

-- For debugging
-- g.neoformat_verbose = 1

-- Lua formatting
g.neoformat_lua_luaformatter = {
   exe = "lua-format",
   args = {
      "--tab-width=3", "--no-use-tab", "--indent-width=3",
      "--break-after-table-lb", "--break-before-table-rb",
      "--no-chop-down-table", "--single-quote-to-double-quote",
      "--no-keep-simple-control-block-one-line",
      "--no-keep-simple-function-one-line", "--extra-sep-at-table-end",
      "--spaces-around-equals-in-field", "--spaces-inside-table-braces",
   },
}

g.neoformat_enabled_lua = { "luaformatter" }

-- Python formatting
-- g.neoformat_python_black {
--    exe = "black",
-- }

-- Basic filetype formatting
g.neoformat_basic_format_align = rc.neoformat.basic_format_align
g.neoformat_basic_format_retab = rc.neoformat.basic_format_retab
g.neoformat_basic_format_trim = rc.neoformat.basic_format_trim
