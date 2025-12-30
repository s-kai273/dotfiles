vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
})

local timer = vim.loop.new_timer()

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    timer:stop()
    timer:start(800, 0, vim.schedule_wrap(function()
      vim.diagnostic.open_float(nil, {
        focus = false,
        scope = "cursor",
      })
    end))
  end,
})
