local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "nvim-lsp-installer")
local present3, coq = pcall(require, "coq")

if not (present1 or present2 or present3) then return end

local rc = require("rc")
local lsp = rc.mappings.plugin.lsp

-- use attach function to only map keys after language server attaches to current buffer
local on_attach = function(_, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   local opts = {
      noremap = true,
      silent = true,
   }

   -- see `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap("n", lsp.declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   buf_set_keymap("n", lsp.definition, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   buf_set_keymap("n", lsp.hover, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   buf_set_keymap("n", lsp.implementation, "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   buf_set_keymap("n", lsp.signature_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   buf_set_keymap("n", lsp.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   buf_set_keymap("n", lsp.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   buf_set_keymap("n", lsp.list_workspace_folders,
                  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   buf_set_keymap("n", lsp.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   buf_set_keymap("n", lsp.rename, "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   buf_set_keymap("n", lsp.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   buf_set_keymap("n", lsp.references, "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   buf_set_keymap("n", lsp.show_line_diagnostics, "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   buf_set_keymap("n", lsp.goto_next, "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   buf_set_keymap("n", lsp.goto_prev, "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   buf_set_keymap("n", lsp.set_loclist, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   buf_set_keymap("n", lsp.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

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

-- diagnostics symbols
local signs = {
   Error = rc.ui.symbols.diagnostic.error,
   Warn = rc.ui.symbols.diagnostic.warn,
   Info = rc.ui.symbols.diagnostic.info,
   Hint = rc.ui.symbols.diagnostic.hint,
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
      spacing = 3,
      severity_limit = "Warning",
   },
   signs = true,
   underline = false,
   update_in_insert = false,
})

-- nvim-lsp-installer
lspinstall.on_server_ready(function(server)
   local opts = {
      on_attach = on_attach,
      flags = {
         debouce_text_changes = 150,
      },
   }
   -- neovim configuration help
   if server == "sumneko_lua" then
      opts.on_new_config = function(opt, root_dir)
         local conf_dir = root_dir == vim.fn.stdpath("config")
         local dev_dir = vim.fn.fnamemodify(root_dir, ":h") == vim.fn.expand("~/Projects/neovim")
         local lua_dev = require("lua-dev").setup({
            library = {
               vimruntime = true,
               types = true,
               plugins = true,
            },
            lspconfig = {
               globals = { "vim" },
            },
         })
         if conf_dir or dev_dir then opt.settings = lua_dev end
      end
   end
   -- typescript configuration
   if server == "tsserver" then opts.cmd = { "yarn", "typescript-language-server", "--stdio" } end
   -- svelte configuration
   if server == "svelte" then opts.cmd = { "yarn", "svelteserver", "--stdio" } end

   server:setup(coq.lsp_ensure_capabilities(opts))
   vim.cmd [[ do User LspAttachBuffers ]]
end)

-- LspUtils options
