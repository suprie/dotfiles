-- Colemak-DH <-> QWERTY toggle for Neovim
-- Allows same finger positions for movements in both layouts

local M = {}

M.enabled = false

-- Colemak-DH to QWERTY mapping (physical key -> vim action)
-- When on Colemak-DH layout, pressing these physical keys should act as QWERTY
local colemak_to_qwerty = {
  -- Home row navigation (hjkl equivalents)
  m = "h", -- left
  n = "j", -- down
  e = "k", -- up
  i = "l", -- right

  -- Upper keys
  k = "n", -- next search
  K = "N", -- prev search
  u = "l", -- (already l, but for visual mode)
  l = "u", -- undo
  L = "U", -- undo line

  -- For insert mode access
  h = "m", -- mark
  j = "e", -- end of word
  J = "E", -- end of WORD

  -- Window navigation (Ctrl mappings handled separately)
}

-- Modes to apply mappings
local modes = { "n", "v", "o", "x" }

-- Store original mappings to restore later
local original_mappings = {}

local function save_original(mode, key)
  local existing = vim.fn.maparg(key, mode, false, true)
  if existing and existing.lhs then
    original_mappings[mode .. key] = existing
  end
end

local function apply_colemak_mappings()
  for from, to in pairs(colemak_to_qwerty) do
    for _, mode in ipairs(modes) do
      save_original(mode, from)
      vim.keymap.set(mode, from, to, { noremap = true, desc = "Colemak: " .. from .. " -> " .. to })
    end
  end

  -- Window navigation with Ctrl
  vim.keymap.set("n", "<C-m>", "<C-w>h", { noremap = true, desc = "Colemak: Window left" })
  vim.keymap.set("n", "<C-n>", "<C-w>j", { noremap = true, desc = "Colemak: Window down" })
  vim.keymap.set("n", "<C-e>", "<C-w>k", { noremap = true, desc = "Colemak: Window up" })
  vim.keymap.set("n", "<C-i>", "<C-w>l", { noremap = true, desc = "Colemak: Window right" })
end

local function remove_colemak_mappings()
  for from, _ in pairs(colemak_to_qwerty) do
    for _, mode in ipairs(modes) do
      pcall(vim.keymap.del, mode, from)
      -- Restore original if exists
      local orig = original_mappings[mode .. from]
      if orig then
        vim.keymap.set(mode, orig.lhs, orig.rhs or orig.callback, {
          noremap = orig.noremap == 1,
          silent = orig.silent == 1,
          expr = orig.expr == 1,
          desc = orig.desc,
        })
      end
    end
  end

  -- Remove window navigation
  pcall(vim.keymap.del, "n", "<C-m>")
  pcall(vim.keymap.del, "n", "<C-n>")
  pcall(vim.keymap.del, "n", "<C-e>")
  pcall(vim.keymap.del, "n", "<C-i>")

  original_mappings = {}
end

function M.enable()
  if M.enabled then return end
  apply_colemak_mappings()
  M.enabled = true
  vim.notify("Colemak-DH mode enabled", vim.log.levels.INFO)
end

function M.disable()
  if not M.enabled then return end
  remove_colemak_mappings()
  M.enabled = false
  vim.notify("QWERTY mode enabled", vim.log.levels.INFO)
end

function M.toggle()
  if M.enabled then
    M.disable()
  else
    M.enable()
  end
end

function M.status()
  return M.enabled and "COLEMAK" or "QWERTY"
end

-- Create user commands
vim.api.nvim_create_user_command("ColemakToggle", M.toggle, { desc = "Toggle Colemak-DH mode" })
vim.api.nvim_create_user_command("ColemakEnable", M.enable, { desc = "Enable Colemak-DH mode" })
vim.api.nvim_create_user_command("ColemakDisable", M.disable, { desc = "Disable Colemak-DH mode" })

return M
