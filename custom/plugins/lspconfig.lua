local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config local
   servers = {
      "clangd",
      "sumneko_lua",
      "vimls",
      "rust_analyzer",
      "gopls",
      "tsserver",
      "cmake",
   }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   local capabilities = vim.lsp.protocol.make_client_capabilities()
   capabilities.offsetEncoding = { "utf-16" }
   require("lspconfig").clangd.setup { capabilities = capabilities }
end

return M
