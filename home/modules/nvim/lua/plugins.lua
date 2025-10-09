-- lua/plugins.lua
-- Configure plugins that are installed via Nix (programs.neovim.plugins)

-- Example: telescope
local ok_telescope, telescope = pcall(require, "telescope")
if ok_telescope then
  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      prompt_prefix = "> ",
    },
  })
end

-- Example: treesitter (configuration only)
local ok_ts, configs = pcall(require, "nvim-treesitter.configs")
if ok_ts then
  configs.setup({
    highlight = { enable = true },
    indent = { enable = true },
  })
end
