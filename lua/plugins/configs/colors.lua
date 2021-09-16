local present, github_theme = pcall(require, "github-theme")
if not present then
   return
end

github_theme.setup({
   theme_style = "dark",
})
