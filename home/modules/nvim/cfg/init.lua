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
