return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
  },
  init = function()
    function _G.dvx()
      local toplevel = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })[1]
      if vim.v.shell_error ~= 0 then
        return ""
      end

      local specs = vim.fn.systemlist({ "git", "-C", toplevel, "config", "--get-all", "diffview.exclude" })
      if vim.v.shell_error ~= 0 then
        return ""
      end

      return table.concat(
        vim.tbl_map(function(spec)
          return ("'%s'"):format(spec)
        end, specs),
        " "
      )
    end
  end,
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
