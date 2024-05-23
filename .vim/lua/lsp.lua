local lspconfig = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup()
vim.lsp.set_log_level("off")
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

