return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "UIEnter",
  config = true,
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.sort_by = function(buf_a, buf_b)
      local a = vim.fn.getbufinfo(buf_a.id)[1]
      local b = vim.fn.getbufinfo(buf_b.id)[1]
      return a.lastused > b.lastused
    end
  end,
  keys = {
    { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer line" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer line" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    { "<leader>ba", "<Cmd>bufdo bdelete<CR>", desc = "Close all buffers" },
  }
}
