local M = {}

-- Lazy loading function for packer
M.lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function() require("packer").loader(plugin) end, timer)
   end
end

-- Mapping helper function stolen from nvChad
M.map = function(mode, keys, cmd, opt)
   local opts = {
      noremap = true,
      silent = true,
   }
   if opt then opts = vim.tbl_extend("force", opts, opt) end

   -- all valid modes allowed
   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   -- helper function allowing mapping multiple modes and keys
   local function map_wrapper(modes, lhs, rhs, options)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do map_wrapper(modes, key, rhs, options) end
      else
         if type(modes) == "table" then
            for _, m in ipairs(modes) do map_wrapper(m, lhs, rhs, options) end
         else
            if valid_modes[modes] and lhs and rhs then
               vim.api.nvim_set_keymap(modes, lhs, rhs, options)
            else
               modes, lhs, rhs = modes or "", lhs or "", rhs or ""
               print("Cannot set mapping [ mode = '" .. modes .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
            end
         end
      end
   end

   map_wrapper(mode, keys, cmd, opts)
end

return M
