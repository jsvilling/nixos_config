-- Color Scheme
local ok, rose = pcall(require, "rose-pine")

rose.setup({
  variant = "moon",       -- auto, main, moon, or dawn
  dark_variant = "moon",
})

vim.cmd("colorscheme rose-pine")