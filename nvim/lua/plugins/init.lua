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
        "rust", "toml",
        "vue", "javascript", "typescript", "tsx", "json",
      },
    },
  },

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

  -- ██████╗  █████╗ ██████╗ ██╗███████╗███████╗ █████╗
  -- ██╔══██╗██╔══██╗██╔══██╗██║██╔════╝██╔════╝██╔══██╗
  -- ██████╔╝███████║██████╔╝██║███████╗███████╗███████║
  -- ██╔═══╝ ██╔══██║██╔══██╗██║╚════██║╚════██║██╔══██║
  -- ██║     ██║  ██║██║  ██║██║███████║███████║██║  ██║
  -- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝

  -- Rust development: rustaceanvim (maintained fork of rust-tools.nvim)
  -- Provides: hover actions, code actions, runnables, debuggables, inlay hints,
  --           rust-analyzer integration, Cargo integration, clippy, expand macros
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<cr>", { buffer = bufnr, desc = "Rust Hover Actions" })
          vim.keymap.set("n", "<leader>ra", "<cmd>RustCodeAction<cr>", { buffer = bufnr, desc = "Rust Code Actions" })
          vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", { buffer = bufnr, desc = "Rust Runnables" })
          vim.keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<cr>", { buffer = bufnr, desc = "Rust Debuggables" })
          vim.keymap.set("n", "<leader>re", "<cmd>RustExpandMacro<cr>", { buffer = bufnr, desc = "Rust Expand Macro" })
          vim.keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<cr>", { buffer = bufnr, desc = "Rust Open Cargo" })
          vim.keymap.set("n", "<leader>rp", "<cmd>RustParentModule<cr>", { buffer = bufnr, desc = "Rust Parent Module" })
          vim.keymap.set("n", "<leader>ri", "<cmd>RustToggleInlayHints<cr>", { buffer = bufnr, desc = "Rust Toggle Inlay Hints" })
        end,
      },
      tools = {
        hover_actions = {
          replace_builtin_hover = true,
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts)
    end,
  },

  -- Cargo.toml support: auto-completion, version highlighting, crate management
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    opts = {
      completion = {
        cmp = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  -- Auto-close and rename HTML/Vue tags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- Debugging: nvim-dap + codelldb for Rust
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Auto-open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- DAP keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
      vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "DAP Step Over" })
      vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<leader>dsO", dap.step_out, { desc = "DAP Step Out" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP Toggle UI" })
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP Terminate" })
    end,
  },
}
