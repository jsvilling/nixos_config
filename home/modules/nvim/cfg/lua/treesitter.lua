-- lua/treesitter.lua
-- Separate file for treesitter config if you want to customize further

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

configs.setup({
  ensure_installed = { "lua", "rust", "python", "nix" },
  highlight = { enable = true },
  indent = { enable = true },
})
