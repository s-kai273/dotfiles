return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "vue",
      "typescript",
      "tsx",
      "javascript",
      "html",
      "css",
      "scss",
      "json",
      "yaml",
      "toml",
      "lua",
      "python",
      "rust",
      "java",
      "markdown",
      "markdown_inline",
      "bash",
      "vim",
      "vimdoc",
      "query",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
