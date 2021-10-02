local core_modules = {
   "core.options", "core.autocmds", "core.mappings", "core.globals",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(R, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

-- Run initialization mappings
require("core.mappings").misc()
