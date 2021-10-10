local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "lspinstall")
local present3, coq = pcall(require, "coq")

if not (present1 or present2 or present3) then return end

local rc = require("rc").mappings.plugin.lsp

-- use attach function to only map keys after language server attaches to current buffer
local on_attach = function(_, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   local opts = {
      noremap = true,
      silent = true,
   }

   -- see `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap("n", rc.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   buf_set_keymap("n", rc.definition, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   buf_set_keymap("n", rc.hover, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   buf_set_keymap("n", rc.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   buf_set_keymap("n", rc.signature_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   buf_set_keymap("n", rc.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   buf_set_keymap("n", rc.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   buf_set_keymap("n", rc.list_workspace_folders,
                  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   buf_set_keymap("n", rc.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   buf_set_keymap("n", rc.rename, "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   buf_set_keymap("n", rc.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   buf_set_keymap("n", rc.references, "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   buf_set_keymap("n", rc.show_line_diagnostics, "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   buf_set_keymap("n", rc.goto_next, "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   buf_set_keymap("n", rc.goto_prev, "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   buf_set_keymap("n", rc.set_loclist, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   buf_set_keymap("n", rc.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

   local handlers = vim.lsp.handlers
   -- extended lsp utils
   handlers["textDocument/codeAction"] = require"lsputil.codeAction".code_action_handler
   handlers["textDocument/references"] = require"lsputil.locations".references_handler
   handlers["textDocument/definition"] = require"lsputil.locations".definition_handler
   handlers["textDocument/declaration"] = require"lsputil.locations".declaration_handler
   handlers["textDocument/typeDefinition"] = require"lsputil.locations".typeDefinition_handler
   handlers["textDocument/implementation"] = require"lsputil.locations".implementation_handler
   handlers["textDocument/documentSymbol"] = require"lsputil.symbols".document_handler
   handlers["workspace/symbol"] = require"lsputil.symbols".workspace_handler

end

-- setup language server configurations
local setup_servers = function()
   lspinstall.setup()

   local servers = require("lspinstall").installed_servers()
   for _, server in ipairs(servers) do
      local config = {
         on_attach = on_attach,
         flags = {
            debouce_text_changes = 150,
         },
      }
      -- Define seperate language configurations here
      if server == "lua" then
         -- neovim configuration language server setup
         config.on_new_config = function(cfg, root_dir)
            local conf_dir = root_dir == vim.fn.stdpath("config")
            -- TODO: This can and should be done better (any directory recursively down)
            local dev_dir = vim.fn.fnamemodify(root_dir, ":h") == vim.fn.expand("~/Projects/neovim")
            if conf_dir or dev_dir then cfg.settings = require("lua-dev").setup().settings end
         end
      end

      lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
   end
end

-- diagnostics symbols
local signs = {
   Error = " ",
   Warn = " ",
   Info = " ",
   Hint = " ",
}

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, {
      text = icon,
      texthl = hl,
      numhl = "",
   })
end

-- UI
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = {
      prefix = " ",
      spacing = 0,
   },
   signs = true,
   underline = false,
   update_in_insert = false,
})

setup_servers()

-- Automatically reload after :LspInstall <server>
lspinstall.post_install_hook = function()
   setup_servers()
   vim.cmd("bufdo e")
end
