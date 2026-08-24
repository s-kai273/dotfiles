-- The `main` branch builds parsers with the `tree-sitter` CLI, so make sure it is
-- available through mason before asking for any parser.
local function ensure_tree_sitter_cli()
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    return
  end

  pcall(function()
    local package = registry.get_package("tree-sitter-cli")
    if not package:is_installed() then
      package:install()
    end
  end)
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    ensure_tree_sitter_cli()

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
