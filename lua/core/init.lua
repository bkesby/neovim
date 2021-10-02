local core_modules = { "core.options", "core.autocmds", "core.mappings" }

-- Helpful print wrapper
P = function(v)
   print(vim.inspect(v))
   return v
end

-- Helpful reload function
if pcall(require, "plenary") then
   RELOAD = require("plenary.reload").reload_module

   R = function(name)
      RELOAD(name)
      return require(name)
   end
end

for _, module in ipairs(core_modules) do
   local ok, err = pcall(R, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

-- Run initialization mappings
require("core.mappings").misc()
