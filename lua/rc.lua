local M = {}

M.ui = {
   -- theme to use from base16
   theme = "onedark"
}

M.options = {

}

M.options.plugin = {
   better_escape = {
      interval = 100,
      shortcut = "jk",
   },
}

-- enable or disable plugins
M.plugin_status = {
   better_escape = true,
}


return M
