local g = vim.g
local rc = require("rc").options.plugin

-- For debugging
-- g.neoformat_verbose = 1

-- Lua formatting
g.neoformat_lua_luaformatter = {
   exe = "lua-format",
   args = {
      "--column-limit=120", "--tab-width=3", "--no-use-tab", "--indent-width=3", "--no-chop-down-table",
      "--single-quote-to-double-quote", "--keep-simple-control-block-one-line", "--keep-simple-function-one-line",
      "--extra-sep-at-table-end", "--spaces-around-equals-in-field", "--no-break-after-operator",
      "--spaces-inside-table-braces",
   }, -- "--break-after-table-lb", "--break-before-table-rb",
}
g.neoformat_enabled_lua = { "luaformatter" }

-- Python formatting
g.neoformat_python_black = {
   exe = "black",
   args = { "-q" },
   replace = true,
}

g.neoformat_python_poetry = {
   exe = "poetry",
   args = { "run", "black" },
   replace = true,
}

g.neoformat_enabled_python = { "poetry", "black" }

-- Rust formatting
g.neoformat_rust_rustfmt = {
   exe = "rustfmt",
   replace = true,
}
g.neoformat_enabled_rust = { "rustfmt" }

-- run all enabled formatters
-- g.neoformat_run_all_formatters = 1

-- Basic filetype formatting
g.neoformat_basic_format_align = rc.neoformat.basic_format_align
g.neoformat_basic_format_retab = rc.neoformat.basic_format_retab
g.neoformat_basic_format_trim = rc.neoformat.basic_format_trim
