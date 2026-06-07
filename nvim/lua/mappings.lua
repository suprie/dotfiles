require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- fzf-lua mappings
map("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find files" })
map("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
map("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "Find buffers" })
map("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "Help tags" })
map("n", "<leader>fr", function() require("fzf-lua").oldfiles() end, { desc = "Recent files" })

-- Claude chat mappings are handled by the plugin's setup configuration

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Colemak-DH / QWERTY toggle
local colemak = require("configs.colemak")
map("n", "<leader>tc", colemak.toggle, { desc = "Toggle Colemak-DH / QWERTY" })
