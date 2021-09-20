local M = {}

M.init = function(theme)
   if not theme then
      theme = require("rc").ui.theme
   end

   -- set the global theme, used in theme switcher
   vim.g.rctheme = theme

   local present, base16 = pcall(require, "base16")

   if present then
      base16(base16.themes[theme], true)

      -- unload to force reload of highlights
      package.loaded["colors.highlights" or false] = nil
      require("colors.highlights")
   else
      return false
   end
end

-- returns a table of colors for given/current theme
M.get = function(theme)
   local present, base16 = pcall(require, "base16")
   if not present then
      return
   end
   theme = theme or vim.g.rctheme

   return base16.themes[theme]
end

return M
