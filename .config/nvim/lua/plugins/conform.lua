return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      rust = { "rustfmt" },
      python = { "black" },
    },
    format_on_save = {
      timeout_ms = 5000,
      lsp_fallback = true,
    },
  },
}
