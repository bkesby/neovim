local core_modules = { "options", "autocmds", "mappings", "globals" }

for _, module in ipairs(core_modules) do
   if pcall(require, "plenary") then
      local ok, err = pcall(R, "core." .. module)
      if not ok then error("Error loading " .. module .. "\n\n" .. err) end
   else
      local ok, err = pcall(require, "core." .. module)
      if not ok then error("Error loading " .. module .. "\n\n" .. err) end
   end
end

-- Run initialization mappings
require("core.mappings").misc()
