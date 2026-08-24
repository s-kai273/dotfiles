vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    cmp.default_capabilities()
  )
end

capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.didChangeWatchedFiles = capabilities.workspace.didChangeWatchedFiles or {}
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

-- Vue SFC support runs in hybrid mode: `vue_ls` owns the template/style blocks
-- while `ts_ls` owns the TypeScript, loading `@vue/typescript-plugin` so that it
-- can resolve symbols inside `.vue` files.
local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  init_options = {
    plugins = { vue_plugin },
  },
  -- `filetypes` is a list, so it replaces the default instead of merging.
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
})

vim.lsp.config("vue_ls", {
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

vim.lsp.config("pyright", {
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      }
    }
  }
})

vim.lsp.config("ruff", {
  capabilities = capabilities,
})

vim.lsp.enable({ "ts_ls", "vue_ls", "eslint", "lua_ls", "pyright", "ruff" })
