local present, dap_install = pcall(require, "dap-install")
if not present then
   return
end

local debuggers = require("dap-install.api.debuggers").get_installed_debuggers()

dap_install.setup()

-- Quick loop through all debuggers with default settings
for _, debugger in ipairs(debuggers) do
   dap_install.config(debugger)
end
