local M = {}

M.init = function(theme)
   if not theme then
      theme = require("rc").ui.theme
   end

   -- set the global theme, used in theme switcher
   vim.g.config_theme = theme

   local present, base16 = pcall(require, "base16")

   if present then
      base16(base16.themes(theme), true)

      -- unload to force reload of highlights
      --package.loaded["colors.highlights" or false] = nil
      --require("colors.highlights")
   else
      return false
   end
end

return M
