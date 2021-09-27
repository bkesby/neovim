local present, cheatsheet = pcall(require, "cheatsheet")

if not present then
   return
end

local mappings = require("rc").mappings

-- add custom mappings from rc into the cheatsheet

-- local function add_to_cheatsheet(section, keymap, desc)
-- if section == "plugin" then
--       for sec, key in pairs(mappings.plugin) do
--          add_to_cheatsheet(sec, key, sec)
--       end
--    end
-- end

-- cheatsheet.add_cheat(description, code, section, tags)

cheatsheet.setup {
   bundled_cheatsheets = {
      enabled = { "default" },
      disabled = { "unicode", "nerd-fonts" },
   },
   bundled_plugin_cheatsheets = true,
   include_only_installed_plugins = true,
}
