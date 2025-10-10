----------------------
-- Color Scheme
----------------------

local ok, rose = pcall(require, "rose-pine")

rose.setup({
  variant = "moon",       -- auto, main, moon, or dawn
  dark_variant = "moon",
})

vim.cmd("colorscheme rose-pine")

----------------------
-- Which key
----------------------

local ok, which_key = pcall(require, "which-key")
if not ok then
  vim.notify("which-key not available (not installed)", vim.log.levels.WARN)
  return
end

which_key.setup({})

which_key.register({
  --f = { '<cmd>echo "demo find"<cr>', 'Demo: find' },
}, { prefix = "<leader>" })
--vim.keymap.set("n", "<leader>x", function() print("hi") end, { desc = "Hi" }) 

----------------------
-- Telescope
----------------------
local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope not available", vim.log.levels.WARN)
  return
end

local ok2, builtin = pcall(require, "telescope.builtin")
if not ok2 then
  vim.notify("telescope.builtin not available", vim.log.levels.WARN)
  return
end
telescope.setup({})
vim.keymap.set("n", "<leader>t", builtin.find_files, { desc = "Find files" })


----------------------
-- Lazygit
----------------------
local ok, lazygit = pcall(require, "lazygit")
if not ok then
  vim.notify("lazygit.nvim not available", vim.log.levels.WARN)
  return
end
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = "Open LazyGit" })