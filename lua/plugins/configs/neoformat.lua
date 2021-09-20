local g = vim.g
local rc = require("rc").options.plugin

-- For debugging
-- g.neoformat_verbose = 1

-- Lua formatting
g.neoformat_lua_luaformatter = {
    exe = "lua-format",
    args = { "--tab-width=3", "--no-use-tab", "indent-width=3" },
}

-- Basic filetype formatting
g.neoformat_basic_format_align = rc.neoformat.basic_format_align
g.neoformat_basic_format_retab = rc.neoformat.basic_format_retab
g.neoformat_basic_format_trim = rc.neoformat.basic_format_trim
