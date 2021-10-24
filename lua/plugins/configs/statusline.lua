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
   icon = " " .. rc.ui.symbols.diagnostic.error,
   hl = "LspDiagnosticsDefaultError",
}
components.active[1][5] = {
   provider = "diagnostic_warnings",
   enabled = function() return lsp.diagnostics_exist "Warning" end,
   icon = " " .. rc.ui.symbols.diagnostic.warn,
   hl = "DiagnosticsDefaultWarn",
}
components.active[1][6] = {
   provider = "diagnostic_hints",
   enabled = function() return lsp.diagnostics_exist "Hint" end,
   icon = " " .. rc.ui.symbols.diagnostic.hint,
   -- hl = "DiagnosticStatusHint",
}
components.active[1][7] = {
   provider = "diagnostic_info",
   enabled = function() return lsp.diagnostics_exist "Information" end,
   icon = " " .. rc.ui.symbols.diagnostic.info,
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
