require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "rust_analyzer", "taplo", "ts_ls", "vue_ls", "eslint", "gopls" }
vim.lsp.enable(servers)

-- Go (gopls) — rich autocomplete, unimported packages, staticcheck
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      completeUnimported = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
        unreachable = true,
        shadow = true,
      },
      codelenses = {
        generate = true,
        test = true,
        tidy = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
