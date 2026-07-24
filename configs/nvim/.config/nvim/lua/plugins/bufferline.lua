return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "UIEnter",
  config = true,
  opts = {
    options = {
      sort_by = "insert_after_current",
    },
  },
  keys = {
    { "]b",         "<Cmd>BufferLineCycleNext<CR>",   desc = "Next buffer line" },
    { "[b",         "<Cmd>BufferLineCyclePrev<CR>",   desc = "Previous buffer line" },
    { "<leader>bp", "<Cmd>BufferLinePick<CR>",        desc = "Pick buffer line" },
    { "<leader>bd", "<Cmd>confirm bdelete<CR>",       desc = "Delete current buffer" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    { "<leader>ba", "<Cmd>confirm bufdo bdelete<CR>", desc = "Close all buffers" },
  }
}
