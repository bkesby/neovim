local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "lspinstall")
local present3, coq = pcall(require, "coq")

if not (present1 or present2 or present3) then
   return
end

local rc = require("rc").mappings.plugin.lsp

-- use attach function to only map keys after language server attaches to current buffer
local on_attach = function(_, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   local opts = { noremap = true, silent = true }

   -- see `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap("n", rc.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   buf_set_keymap("n", rc.definition, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   buf_set_keymap("n", rc.hover, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   buf_set_keymap("n", rc.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   buf_set_keymap("n", rc.signature_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   buf_set_keymap("n", rc.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   buf_set_keymap("n", rc.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   buf_set_keymap("n", rc.list_workspace_folders, "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   buf_set_keymap("n", rc.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   buf_set_keymap("n", rc.rename, "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   buf_set_keymap("n", rc.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   buf_set_keymap("n", rc.references, "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   buf_set_keymap("n", rc.show_line_diagnostics, "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   buf_set_keymap("n", rc.goto_prev, "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   buf_set_keymap("n", rc.goto_prev, "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   buf_set_keymap("n", rc.set_loclist, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   buf_set_keymap("n", rc.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

   -- enable completion triggered by <c-x><c-o>
   -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

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
