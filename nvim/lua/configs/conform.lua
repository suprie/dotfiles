local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    vue = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
