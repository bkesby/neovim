-- Print wrapper
P = function(v)
   print(vim.inspect(v))
   return v
end

-- Reload function
if pcall(require, "plenary") then
   R = function(module)
      require("plenary.reload").reload_module(module)
      return require(module)
   end
end
