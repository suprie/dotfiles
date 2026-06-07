require "nvchad.autocmds"

-- Enable treesitter highlighting for supported languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "kotlin", "java", "swift", "lua", "vim", "html", "css" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
