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
    opts = function(_, opts)
      pcall(function()
        local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
        local function force_main_branch(lang, url)
          if parser_configs[lang] and parser_configs[lang].install_info then
            if url then
              parser_configs[lang].install_info.url = url
            end
            parser_configs[lang].install_info.branch = "main"
            parser_configs[lang].install_info.revision = nil
          end
        end

        force_main_branch("lua", "https://github.com/tree-sitter-grammars/tree-sitter-lua")
        force_main_branch("gomod")
        force_main_branch("kotlin")
      end)

      local function add_unique(list, items)
        for _, item in ipairs(items) do
          if not vim.tbl_contains(list, item) then
            table.insert(list, item)
          end
        end
      end

      -- Load base46 highlights (required for syntax coloring)
      pcall(function()
        dofile(vim.g.base46_cache .. "syntax")
        dofile(vim.g.base46_cache .. "treesitter")
      end)

      opts.ensure_installed = opts.ensure_installed or {}
      add_unique(opts.ensure_installed, {
        "go", "gomod", "gosum", "gowork",  -- Go
        "rust", "toml",                     -- Rust
        "kotlin",                           -- Kotlin
        "java",                             -- Java
      })

      local has_tree_sitter_cli = vim.fn.executable "tree-sitter" == 1
      if has_tree_sitter_cli then
        add_unique(opts.ensure_installed, { "swift" }) -- Swift parser generation needs tree-sitter CLI.
      else
        opts.ignore_install = opts.ignore_install or {}
        add_unique(opts.ignore_install, { "swift" })
      end

      return opts
    end,
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
    lazy = false,
    config = function()
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }
    end,
  },

  -- Go development
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        lsp_cfg = false, -- we use nvchad's lspconfig
        lsp_keymaps = false,
        dap_debug = true,
      })
    end,
    keys = {
      { "<leader>gr", "<cmd>GoRun<cr>", desc = "Go Run" },
      { "<leader>gt", "<cmd>GoTest<cr>", desc = "Go Test" },
      { "<leader>gtf", "<cmd>GoTestFunc<cr>", desc = "Go Test Function" },
      { "<leader>gc", "<cmd>GoCoverage<cr>", desc = "Go Coverage" },
      { "<leader>gi", "<cmd>GoImpl<cr>", desc = "Go Implement Interface" },
      { "<leader>gfs", "<cmd>GoFillStruct<cr>", desc = "Go Fill Struct" },
      { "<leader>gta", "<cmd>GoAddTag<cr>", desc = "Go Add Tags" },
      { "<leader>gtr", "<cmd>GoRmTag<cr>", desc = "Go Remove Tags" },
      { "<leader>gie", "<cmd>GoIfErr<cr>", desc = "Go if err" },
    },
  },

  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    lazy = false,
    config = function()
      require("claudecode").setup({
        auto_start = true,
        terminal = {
          split_side = "right",
          split_width_percentage = 0.3,
        },
      })
    end,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = { "v" }, desc = "Send to Claude" },
      { "<leader>aa", "<cmd>ClaudeCodeAdd<cr>", mode = { "n", "v" }, desc = "Add file/selection to Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    },
  },
}
