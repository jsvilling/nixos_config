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

-- small debug, remove later
vim.notify("which-key: config running")
print ("Hello nvim2")

which_key.setup({}) -- default setup

which_key.register({
  f = { '<cmd>echo "demo find"<cr>', 'Demo: find' },
  t = { '<cmd>echo "demo test"<cr>', 'Demo: test' },
}, { prefix = "<leader>" })


vim.keymap.set("n", "<leader>x", function() print("hi") end) 



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

-- Keymap: Space + p to open file picker
vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Find files" })