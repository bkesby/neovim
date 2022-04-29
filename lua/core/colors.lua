-- Theme config loaded from plugun config
local present, theme = pcall(require, 'onedarkpro')
if not present then
   return
end

-- Change default style
theme.setup {
   options = {
      cursorline = true,
      transparency = true,
   },
}

theme.load()
