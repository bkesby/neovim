local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "lspinstall")
local present3, coq = pcall(require, "coq")

if not (present1 or present2 or present3) then
   return
end

-- use attach function to only map keys after language server attaches to current buffer
local on_attach = function(client, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   -- enable completion triggered by <c-x><c-o>
   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

end

lspinstall.setup()

local servers = require("lspinstall").installed_servers()

for _, server in ipairs(servers) do
   lspconfig[server].setup(coq.lsp_ensure_capabilities {
      on_attach = on_attach,
      flags = {
         debouce_text_changes = 150,
      },
   })
end
