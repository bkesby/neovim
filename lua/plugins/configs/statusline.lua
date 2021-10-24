local present, statusline = pcall(require, "feline")
if not present then return end

local lsp = require "feline.providers.lsp"
local rc = require("rc")
local opts = rc.ui.plugin.statusline
local colors = require("onedarkpro").get_colors(rc.ui.theme)

-- initialize component table
local components = {
   active = {},
   inactive = {},
}

-- initialize left, middle, right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- left section{{{
-- main icon
components.active[1][1] = {
   provider = opts.icon_styles.main_icon,

   hl = {
      fg = colors.fg,
      bg = colors.bg,
   },

   right_sep = {
      str = opts.icon_styles.right,
      hl = {
         fg = colors.fg,
         bg = colors.bg,
      },
   },
}

-- filename
components.active[1][2] = {
   provider = function()
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
         return icon
      end
      return " " .. icon .. " " .. filename .. " "
   end,
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
}

-- directory
components.active[1][3] = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "  " .. dir_name .. " "
   end,
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
}

-- diagnostics
components.active[1][4] = {
   provider = "diagnostic_errors",
   enabled = function() return lsp.diagnostics_exist "Error" end,
   icon = " " .. rc.ui.diagnostic.error,
   -- hl = "DiagnosticStatusError",
}
components.active[1][5] = {
   provider = "diagnostic_warnings",
   enabled = function() return lsp.diagnostics_exist "Warning" end,
   icon = " " .. rc.ui.diagnostic.warn,
   -- hl = "DiagnosticStatusWarn",
}
components.active[1][6] = {
   provider = "diagnostic_hints",
   enabled = function() return lsp.diagnostics_exist "Hint" end,
   icon = " " .. rc.ui.diagnostic.hint,
   -- hl = "DiagnosticStatusHint",
}
components.active[1][7] = {
   provider = "diagnostic_info",
   enabled = function() return lsp.diagnostics_exist "Information" end,
   icon = " " .. rc.ui.diagnostic.info,
   -- hl = "DiagnosticStatusInfo",
}
-- }}}
-- middle section{{{
-- lsp
components.active[2][1] = {
   provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]
      if Lsp then
         local msg = Lsp.message or ""
         local percentage = Lsp.percentage or 0
         local title = Lsp.title or ""
         local spinners = { "", "", "" }
         local success_icon = { "", "", "" }

         local ms = vim.loop.hrtime() / 100000
         local frame = math.floor(ms / 120) % #spinners

         if percentage >= 70 then
            return string.format(" %%<%s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
         else
            return string.format(" %%<%s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
         end
      end
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      for _, client in ipairs(clients) do
         local filetypes = client.config.filetypes
         if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return " " .. client.name end
      end
      return " ﭥ "
   end,
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
} -- }}}
-- right section{{{
-- git branch
-- git diff
components.active[3][1] = {
   provider = "git_diff_added",
   icon = " " .. rc.ui.git.added,
   -- hl = "GitAdd",
}
components.active[3][2] = {
   provider = "git_diff_changed",
   icon = " " .. rc.ui.git.modified,
   -- hl = "GitChange",
}
components.active[3][3] = {
   provider = "git_diff_removed",
   icon = " " .. rc.ui.git.removed,
   -- hl = "GitDelete",
}
components.active[3][4] = {
   provider = "git_branch",
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
   icon = "  ",
}
components.active[3][5] = {
   provider = " " .. opts.icon_styles.left,
}

-- components.active[3][6] = {
--    provider = "vi_mode",
--    -- hl = function()
--    --    return {
--    --       name = require("feline.providers.vi_mode").get_mode_highlight_name(),
--    --       fg = require("feline.providers.vi_mode").get_mode_color(),
--    --       style = "bold",
--    --    }
--    -- end,
--    right_sep = {
--       str = opts.icon_styles.right,
--       hl = {
--          fg = colors.fg,
--          bg = colors.fg,
--       },
--    },
-- } -- }}}

statusline.setup({
   -- colors = {
   --    fg = colors.fg,
   --    bg = colors.bg,
   -- },
   components = components,
})

-- Edit lualine auto selected theme
-- local theme = require("lualine.themes." .. rc.theme)
-- theme.inactive.c = {
--    fg = colors.base01,
--    bg = colors.base00,
--    gui = "strikethrough",
-- }
-- -- theme.inactive.y.bg = colors.base00
-- 
-- -- Config (built with functions below)
-- local config = {
--    options = {
--       icons_enabled = true,
--       theme = theme,
--       component_separators = {
--          left = "",
--          right = "",
--       },
--       section_separators = {
--          left = " ",
--          right = " ",
--       },
--       disabled_filetypes = { "dashboard" },
--    },
--    -- Reset defaults
--    sections = {
--       lualine_a = {},
--       lualine_b = {},
--       lualine_c = {},
--       lualine_x = {},
--       lualine_y = {},
--       lualine_z = {},
--    },
--    inactive_sections = {
--       lualine_a = {},
--       lualine_b = {},
--       lualine_c = {},
--       lualine_x = {},
--       lualine_y = {},
--       lualine_z = {},
--    },
--    tabline = {},
--    extensions = { "toggleterm", "fugitive" },
-- }
-- 
-- -- Conditions
-- local conditions = {
--    not_empty = function() return fn.empty(fn.expand "%:t") ~= 1 end,
--    wide_enough = function() return fn.winwidth(0) > 69 end,
-- }
-- 
-- -- Insert functions
-- local function insert_left(component) table.insert(config.sections.lualine_c, component) end
-- 
-- local function insert_right(component) table.insert(config.sections.lualine_y, component) end
-- 
-- -- Display functions
-- local mode_function = function()
--    local mode = {
--       n = colors.base07, -- normal
--       no = colors.base07, -- N-Pending
--       i = colors.base0B, -- insert
--       ic = colors.base0B, -- insert ...
--       v = colors.base0C, -- visual
--       [""] = colors.base0C, -- visual block
--       V = colors.base0C, -- visual line
--       s = colors.base0E, -- select
--       S = colors.base0E, -- select line
--       [""] = colors.base0E, -- select block
--       R = colors.base09, -- replace
--       Rv = colors.base09, -- v-replace
--       c = colors.base08, -- command
--       cv = colors.base08, -- command
--       ce = colors.base08, -- command
--       ["!"] = colors.base08, -- shell
--       r = colors.base0E, -- prompt
--       rm = colors.base0E, -- more
--       ["r?"] = colors.base0E, -- confirm
--       t = colors.base0F, -- terminal
--    }
--    -- Update highlight groups
--    local fg = "hi! LualineModeForeground" .. " guifg=" .. mode[fn.mode()] .. " guibg=" .. colors.base01 .. " gui='bold'"
--    local bg = "hi! LualineModeBackground" .. " guifg=" .. colors.base01 .. " guibg=" .. mode[fn.mode()]
--    ncmd(fg .. " | " .. bg)
--    return ""
-- end
-- 
-- local lsp_server = function()
--    local msg = "ﭥ"
--    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--    local clients = vim.lsp.get_active_clients()
--    if next(clients) == nil then return msg end
--    for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and fn.index(filetypes, buf_ft) ~= -1 then return client.name end
--    end
--    return msg
-- end
-- 
-- insert_left {
--    mode_function,
--    color = "LualineModeBackground",
--    padding = {
--       left = 1,
--       right = 1,
--    },
-- }
-- 
-- insert_left {
--    "filename",
--    color = "LualineModeForeground",
--    cond = conditions.not_empty,
-- }
-- 
-- insert_left {
--    "location",
--    cond = conditions.wide_enough,
-- }
-- 
-- insert_left {
--    "diagnostics",
--    sources = { "nvim_lsp" },
--    symbols = {
--       error = " ",
--       warn = " ",
--       info = " ",
--       hint = " ",
--    },
-- }
-- 
-- -- middle buffer
-- insert_left {
--    function() return "%=" end,
--    cond = conditions.wide_enough,
-- }
-- 
-- insert_left {
--    lsp_server,
--    icon = " ",
--    cond = conditions.wide_enough,
--    color = {
--       fg = colors.base08,
--    },
-- }
-- 
-- -- Right side
-- insert_right {
--    "diff",
--    symbols = {
--       added = " ",
--       modified = "柳",
--       removed = " ",
--    },
--    diff_color = {
--       added = {
--          fg = colors.base0B,
--       },
--       modified = {
--          fg = colors.base09,
--       },
--       removed = {
--          fg = colors.base08,
--       },
--    },
--    cond = conditions.wide_enough,
-- }
-- 
-- insert_right {
--    "filetype",
--    colored = true,
--    icon_only = false,
--    cond = conditions.wide_enough,
-- }
-- 
-- insert_right {
--    "branch",
--    icon = " ",
--    color = "LualineModeForeground",
-- }
-- 
-- -- TODO: Create a clock function using sun phase icons(brightness)
-- insert_right {
--    function() return " ﲤ " end,
--    color = "LualineModeBackground",
--    padding = {
--       left = 0,
--       right = 0,
--    },
-- }
-- 
-- statusline.setup(config)
