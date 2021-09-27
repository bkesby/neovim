local present, statusline = pcall(require, "lualine")
if not present then
   return
end

local fn = vim.fn
local ncmd = vim.api.nvim_command

local rc = require("rc").ui.plugin.statusline
local colors = require("colors").get()

-- Config (built with functions below)
local config = {
   options = {
      icons_enabled = true,
      theme = rc.theme,
      component_separators = {
         left = "",
         right = "",
      },
      section_separators = {
         left = " ",
         right = " ",
      },
      disabled_filetypes = { "dashboard" },
   },
   -- Reset defaults
   sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
   },
   tabline = {},
   extensions = { "toggleterm", "fugitive" },
}

-- Conditions
local conditions = {
   not_empty = function()
      return fn.empty(fn.expand "%:t") ~= 1
   end,
   wide_enough = function()
      return fn.winwidth(0) > 79
   end,
}

-- Insert functions
local function insert_left(component)
   table.insert(config.sections.lualine_c, component)
end

local function insert_right(component)
   table.insert(config.sections.lualine_y, component)
end

-- Display functions
local mode_function = function()
   local mode = {
      n = colors.base07, -- normal
      no = colors.base07, -- N-Pending
      i = colors.base0B, -- insert
      ic = colors.base0B, -- insert ...
      v = colors.base0C, -- visual
      [""] = colors.base0C, -- visual block
      V = colors.base0C, -- visual line
      s = colors.base0E, -- select
      S = colors.base0E, -- select line
      [""] = colors.base0E, -- select block
      R = colors.base09, -- replace
      Rv = colors.base09, -- v-replace
      c = colors.base08, -- command
      cv = colors.base08, -- command
      ce = colors.base08, -- command
      ["!"] = colors.base08, -- shell
      r = colors.base0E, -- prompt
      rm = colors.base0E, -- more
      ["r?"] = colors.base0E, -- confirm
      t = colors.base0F, -- terminal
   }
   -- Update highlight groups
   local fg = "hi! LualineModeForeground" .. " guifg=" .. mode[fn.mode()] ..
                  " guibg=" .. colors.base01 .. " gui='bold'"
   local bg = "hi! LualineModeBackground" .. " guifg=" .. colors.base01 ..
                  " guibg=" .. mode[fn.mode()]
   ncmd(fg .. " | " .. bg)
   return ""
end

local lsp_server = function()
   local msg = "No Active Lsp"
   local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
   local clients = vim.lsp.get_active_clients()
   if next(clients) == nil then
      return msg
   end
   for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
         return client.name
      end
   end
   return msg
end

insert_left {
   mode_function,
   color = "LualineModeBackground",
   padding = {
      left = 1,
      right = 1,
   },
}

insert_left {
   "filename",
   color = "LualineModeForeground",
   cond = conditions.not_empty,
}

insert_left { "location" }

insert_left {
   "diagnostics",
   sources = { "nvim_lsp" },
   symbols = {
      error = " ",
      warn = " ",
      info = " ",
      hint = " ",
   },
}

-- middle buffer
insert_left {
   function()
      return "%="
   end,
}

insert_left {
   lsp_server,
   icon = " LSP:",
   cond = conditions.wide_enough,
   color = {
      fg = colors.base08,
   },
}

-- Right side
insert_right {
   "diff",
   symbols = {
      added = " ",
      modified = "柳",
      removed = " ",
   },
   diff_color = {
      added = {
         fg = colors.base08,
      },
      modified = {
         fg = colors.base09,
      },
      removed = {
         fg = colors.base0C,
      },
   },
}

insert_right {
   "filetype",
   colored = false,
   icon_only = false,
   cond = conditions.wide_enough,
}

insert_right {
   "branch",
   icon = " ",
   color = "LualineModeForeground",
}

insert_right {
   function()
      return "▐██"
   end,
   color = "LualineModeForeground",
   padding = {
      left = 0,
      right = 0,
   },
}

statusline.setup(config)
