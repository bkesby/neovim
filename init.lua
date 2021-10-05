local init_modules = { "core" }

-- Reload function (Placed here to be used in rest of setup)
if pcall(require, "plenary") then
   R = function(module)
      require("plenary.reload").reload_module(module)
      return require(module)
   end
end

for _, module in ipairs(init_modules) do
   local ok, err = pcall(require, module)
   if not ok then error("Error loading " .. module .. "\n\n" .. err) end
end
