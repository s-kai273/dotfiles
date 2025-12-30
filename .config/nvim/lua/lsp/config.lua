vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp.default_capabilities(capabilities)
end

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("eslint", {
  settings = {
    workingDirectory = { mode = "auto" },
  },
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.enable({ "ts_ls", "eslint", "lua_ls" })
