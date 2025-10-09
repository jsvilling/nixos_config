-- nvim-tree
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree not available", vim.log.levels.WARN)
  return
end

-- Recommended setup (from nvim-tree readme)
nvim_tree.setup({
  sort_by = "name",
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Which key

local ok, which_key = pcall(require, "which-key")
if not ok then
  vim.notify("which-key not available (not installed)", vim.log.levels.WARN)
  return
end

-- small debug, remove later
vim.notify("which-key: config running")
print ("Hello nvim2")

which_key.setup({}) -- default setup

which_key.register({
  f = { '<cmd>echo "demo find"<cr>', 'Demo: find' },
  t = { '<cmd>echo "demo test"<cr>', 'Demo: test' },
}, { prefix = "<leader>" })
