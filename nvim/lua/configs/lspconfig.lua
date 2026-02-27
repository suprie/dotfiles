require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "gopls",           -- Go
  "rust_analyzer",   -- Rust
  "kotlin_language_server", -- Kotlin
  "jdtls",           -- Java
  "sourcekit",       -- Swift (built-in with Xcode on macOS)
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
