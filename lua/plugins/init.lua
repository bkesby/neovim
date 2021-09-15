local present, packer = pcall(require, "plugins.packerinit")

if not present then
   return false
end

print "Works packer"

-- stop linting errors
local use = packer.use

return packer.startup(function()

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

end)
