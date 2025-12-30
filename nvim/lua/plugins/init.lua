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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "go", "gomod", "gosum", "gowork",  -- Go
        "kotlin",                           -- Kotlin
        "java",                             -- Java
        "swift",                            -- Swift
      },
    },
  },

  -- fzf-native for telescope (faster fuzzy finding)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- fzf.vim for standalone fzf integration
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }
    end,
  },
}
