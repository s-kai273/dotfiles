return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    { "<leader>a", "<cmd>NvimTreeFocus<CR>",  desc = "Focus file tree" },
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = false,
      },

      update_focused_file = {
        enable = true,
        update_root = true,
      },

      git = {
        enable = true,
        ignore = false,
      },

      filters = {
        dotfiles = false,
      },

      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}
