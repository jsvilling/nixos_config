-- lua/lsp.lua
-- Basic example using nvim-lspconfig

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

-- Example for Rust
lspconfig.rust_analyzer.setup({})

-- Example for Lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})
