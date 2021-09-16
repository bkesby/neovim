local present, cheatsheet = pcall(require, "cheatsheet")

if not present then
   return
end

local mappings = require("rc").mappings

require("cheatsheet").setup {
   bundled_cheatsheet = {
      enabled = { "default" },
      disabled = { "unicode", "nerd-fonts" },
   },
   bundled_plugin_cheatsheets = false,
   include_only_installed_plugins = true,
}
