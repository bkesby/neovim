local present, statusline = pcall(require, "feline")
if not present then return end

local lsp = require "feline.providers.lsp"
local cursor = require "feline.providers.cursor"
local vimode_utils = require "feline.providers.vi_mode"
local rc = require("rc")
local opts = rc.ui.plugin.statusline

local colors = require("onedarkpro").get_colors(rc.ui.theme)

local vi_mode_colors = {
   NORMAL = colors.white,
   INSERT = colors.green,
   VISUAL = colors.purple,
   OP = colors.white,
   BLOCK = colors.blue,
   REPLACE = colors.red,
   ["V-REPLACE"] = colors.red,
   ENTER = colors.cyan,
   MORE = colors.cyan,
   SELECT = colors.orange,
   COMMAND = colors.green,
   SHELL = colors.green,
   TERM = colors.green,
   NONE = colors.yellow,
}

local properties = {
   force_inactive = {
      filetypes = { "Dashboard", "packer", "fugitive", "fugitiveblame" },
   },
}

local vimode_hl = function()
   return {
      name = vimode_utils.get_mode_highlight_name(),
      fg = vimode_utils.get_mode_color(),
   }
end

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
   provider = opts.icon_styles.edge,
   right_sep = " ",
   hl = vimode_hl,
}
-- directory
components.active[1][2] = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return " " .. dir_name .. " "
   end,
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 80 end,
   hl = {
      style = "bold",
   },
}
-- filename
components.active[1][3] = {
   provider = function()
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
         return icon
      end
      return icon .. " " .. filename .. " "
   end,
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
   left_sep = " ",
}
-- diagnostics
components.active[1][4] = {
   provider = "diagnostic_errors",
   enabled = function() return lsp.diagnostics_exist "Error" end,
   icon = " " .. rc.ui.symbols.diagnostic.error,
   hl = "LspDiagnosticsDefaultError",
}
components.active[1][5] = {
   provider = "diagnostic_warnings",
   enabled = function() return lsp.diagnostics_exist "Warning" end,
   icon = " " .. rc.ui.symbols.diagnostic.warn,
   hl = "LspDiagnosticsDefaultWarning",
}
components.active[1][6] = {
   provider = "diagnostic_hints",
   enabled = function() return lsp.diagnostics_exist "Hint" end,
   icon = " " .. rc.ui.symbols.diagnostic.hint,
   hl = "LspDiagnosticsDefaultHint",
}
components.active[1][7] = {
   provider = "diagnostic_info",
   enabled = function() return lsp.diagnostics_exist "Information" end,
   icon = " " .. rc.ui.symbols.diagnostic.info,
   hl = "LspDiagnosticsDefaultInformation",
}
-- filler
components.active[1][8] = {
   provider = " ",
   hl = {
      fg = colors.cursorline,
   },
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
   hl = {
      fg = colors.yellow,
   },
} -- }}}
-- right section{{{
-- git branch
-- git diff
components.active[3][1] = {
   provider = "git_diff_added",
   icon = " " .. rc.ui.symbols.git.added,
   hl = "GitAdd",
}
components.active[3][2] = {
   provider = "git_diff_changed",
   icon = " " .. rc.ui.symbols.git.modified,
   hl = "GitChange",
}
components.active[3][3] = {
   provider = "git_diff_removed",
   icon = " " .. rc.ui.symbols.git.removed,
   hl = "GitDelete",
}
components.active[3][4] = {
   provider = "git_branch",
   enabled = function(winid) return vim.api.nvim_win_get_width(winid) > 70 end,
   icon = "  ",
   left_sep = " ",
   hl = {
      fg = colors.purple,
      style = "bold",
   },
}
components.active[3][5] = {
   provider = function() return cursor.position() end,
   left_sep = " ",
}
components.active[3][6] = {
   provider = opts.icon_styles.edge,
   left_sep = " ",
   hl = vimode_hl,
}
--- }}}

statusline.setup({
   colors = {
      fg = "NONE",
      bg = colors.color_column,
   },
   components = components,
   properties = properties,
   vi_mode_colors = vi_mode_colors,
})
