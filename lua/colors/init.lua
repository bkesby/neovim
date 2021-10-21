local M = {}

M.init = function(theme)
   if not theme then theme = require("rc").ui.theme end

   -- set the global theme, used in theme switcher
   vim.g.rctheme = theme

   local present, base16 = pcall(require, "base16")

   if present then
      base16(base16.themes[theme], true)
      -- reload theme highlights
      R("colors.highlights")
   else
      return false
   end
end

-- returns a table of colors for given/current theme
M.get = function(theme)
   local present, base16 = pcall(require, "base16")
   if not present then return end
   theme = theme or vim.g.rctheme
   local t = {
      name = theme,
   }
   -- add # to color codes
   for k, v in pairs(base16.themes[theme]) do t[k] = "#" .. v end

   return t
end

return M
