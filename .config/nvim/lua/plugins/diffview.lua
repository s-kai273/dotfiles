return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Open git diff view" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close git diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Open file git history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Open git history" },
  },
  opts = {
    file_panel = {
      win_config = {
        position = "bottom",
        height = 16,
      },
    },
  },
}
