local present, cheatsheet = pcall(require, "cheatsheet")

if not present then return end

local mappings = require("maps")
local user_maps = mappings.user
local plugin_maps = mappings.plugin

-- cheatsheet.add_cheat(description, code, section, tags)
-- add custom user mappings
for desc, code in pairs(user_maps) do
   local description = desc:gsub("_", " ")
   cheatsheet.add_cheat(description, code, "custom")
end

-- add custom plugin mappings
for sec, maps in pairs(plugin_maps) do
   for desc, code in pairs(maps) do
      local description = desc:gsub("_", " ")
      cheatsheet.add_cheat(description, code, sec)
   end
end

cheatsheet.setup {
   bundled_cheatsheets = {
      enabled = { "default" },
      disabled = { "unicode", "nerd-fonts" },
   },
   bundled_plugin_cheatsheets = true,
   include_only_installed_plugins = true,
}
