local function set_oil_width()
  local w = math.floor(vim.o.columns * 0.15)
  if w < 20 then w = 20 end
  vim.cmd("vertical resize " .. (vim.o.columns - w))
  vim.cmd("setlocal winfixwidth")
end

local function setup_split_oil(opts)
  require("oil").setup(opts)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function(ev)
      vim.keymap.set("n", "<CR>", function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()
        if not entry then return end

        if entry.type == "directory" then
          oil.select()
          return
        end

        local dir = oil.get_current_dir()
        if not dir then return end

        local path = dir .. entry.name

        local curwin = vim.api.nvim_get_current_win()
        vim.cmd("wincmd l")
        if vim.api.nvim_get_current_win() == curwin then
          vim.cmd("vsplit")
          vim.cmd("wincmd l")
        end

        vim.cmd.edit(vim.fn.fnameescape(path))
        set_oil_width()
      end, { buffer = ev.buf, silent = true, desc = "Oil: open in right window" })
    end,
  })
end

return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    view_options = { show_hidden = true },
  },
  config = function(_, opts)
    setup_split_oil(opts)
  end,
  keys = {
    {
      "<leader>o",
      function() require("oil").open() end,
      desc = "Open Oil",
    },
  },
}
