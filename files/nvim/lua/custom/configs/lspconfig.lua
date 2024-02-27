local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfigs = require("lspconfig")
local util = require "lspconfig/util"

lspconfigs.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

lspconfigs.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  cmd_env = {
    GOFLAGS = "-tags=test,e2e_test,integration_test,acceptance_test",
  },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfigs.golangci_lint_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go" },
}
