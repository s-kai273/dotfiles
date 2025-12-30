require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",     -- TypeScript / JavaScript
    "lua_ls",    -- Lua
    "pyright",   -- Python
    "rust_analyzer",
  },
})
