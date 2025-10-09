-- Basic Neovim runtime setup and module loading

vim.g.mapleader = ' '        -- leader = Space (explicit)

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

print ("Hello nvim")

-- Load modular config files (in lua/)
pcall(require, "plugins")
-- pcall(require, "lsp")
-- pcall(require, "treesitter")

-- Plugins
print("plugins.lua is running")

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
