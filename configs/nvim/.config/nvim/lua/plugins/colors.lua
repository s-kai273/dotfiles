return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    local function set_highlights()
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#32361a", reverse = false })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#0f3a42", reverse = false })
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#2b5360", bold = true, reverse = false })
      vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#fb4934", bg = "#3c1f1e", reverse = false })

      vim.api.nvim_set_hl(0, "diffAdded", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "diffChanged", { fg = "#8ec07c" })
      vim.api.nvim_set_hl(0, "diffRemoved", { fg = "#fb4934" })
    end

    vim.cmd.colorscheme("gruvbox")
    set_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "gruvbox",
      callback = set_highlights,
    })
  end,
}
