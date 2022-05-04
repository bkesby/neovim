-- local core_modules = { "options", "autocmds", "mappings", "globals" }
local core_modules = { "autocmds", "options", "mappings" }

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, "core." .. module)
   if not ok then error("Error loading " .. module .. "\n\n" .. err) end
end

-- Run initialization mappings
require("core.mappings").misc()
