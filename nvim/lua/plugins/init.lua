return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        -- You can customize fzf-lua options here
        winopts = {
          height = 0.85,
          width = 0.80,
        },
      })
    end,
  },

  {
    "wtfox/claude-chat.nvim",
    opts = {
      split = "vsplit",      -- "vsplit", "split", or "float"
      position = "right",    -- "right", "left", "top", "bottom" (ignored for float)
      width = 0.6,           -- Percentage of screen width (for vsplit or float)
      height = 0.8,          -- Percentage of screen height (for split or float)
      claude_cmd = "claude", -- Command to invoke Claude Code
      float_opts = {         -- Options for floating window
        relative = "editor",
        border = "rounded",
        title = " Claude Chat ",
        title_pos = "center",
      },
      keymaps = {
        global = "<leader>cc",
        terminal = {
          close = "<C-q>",
          toggle = "<C-.>",
        },
      },
    },
  },
}
