require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- FZF mappings
map("n", "<leader>ff", "<cmd>Files<cr>", { desc = "FZF find files" })
map("n", "<leader>fg", "<cmd>Rg<cr>", { desc = "FZF ripgrep search" })
map("n", "<leader>fb", "<cmd>Buffers<cr>", { desc = "FZF buffers" })
map("n", "<leader>fh", "<cmd>History<cr>", { desc = "FZF file history" })
map("n", "<leader>fc", "<cmd>Commits<cr>", { desc = "FZF git commits" })
map("n", "<leader>fs", "<cmd>GFiles?<cr>", { desc = "FZF git status" })
map("n", "<leader>fl", "<cmd>Lines<cr>", { desc = "FZF lines in buffers" })
map("n", "<C-p>", "<cmd>Files<cr>", { desc = "FZF find files (Ctrl+P)" })
