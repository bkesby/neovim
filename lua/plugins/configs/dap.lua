local present, dap_python = pcall(require, "dap-python")
if not present then return end

-- setup python debugging
dap_python.setup(vim.fn.expand("$PYENV_ROOT/versions/debug/bin/python"))
-- local debuggers = require("dap-install.api.debuggers").get_installed_debuggers()
-- dap_install.setup()

-- Quick loop through all debuggers with default settings
-- for _, debugger in ipairs(debuggers) do
--    dap_install.config(debugger)
-- end
