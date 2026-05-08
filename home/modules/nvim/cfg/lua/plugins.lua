---------------------
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
vim.keymap.set("n", "<leader>t", builtin.find_files, { desc = "Telescope" })
vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Search" })

----------------------
-- Lazygit
----------------------
local ok, lazygit = pcall(require, "lazygit")
if not ok then
  vim.notify("lazygit.nvim not available", vim.log.levels.WARN)
  return
end
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = "LazyGit" })

----------------------
-- Treesitter
----------------------
local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter not available", vim.log.levels.WARN)
  return
end

ts.setup({
  highlight = {
    enable = true,                      -- enable syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },           -- smarter indentation
})

----------------------
-- Neo  Tree
----------------------

require('neo-tree').setup({
  window = {
    mappings = {
      ["esc"] = function() 
        vim.cmd("wincmd r")
      end,
    }
  },
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = { visible = true },
  },
  git_status = {
    symbols = {
      added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
      deleted = '✖', -- this can only be used in the git_status source
      renamed = '󰁕', -- this can only be used in the git_status source
      untracked = '',
      ignored = '',
      unstaged = '󰄱',
      staged = '',
      conflict = '',
    },
  },
})
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = "Neo Tree" })
vim.keymap.set('n', '<leader>r', '<cmd>Neotree<CR>', { desc = "Neo Tree" })

----------------------
-- Toggleterm
----------------------

require('toggleterm').setup({
  direction = "float",
})
vim.keymap.set("n", "<leader>p", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<leader>p", "<cmd>ToggleTerm<CR>")
