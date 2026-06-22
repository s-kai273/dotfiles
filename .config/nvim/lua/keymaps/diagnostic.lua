vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
})

local timer = vim.uv.new_timer()

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

local function copy_diagnostic_under_cursor()
  local diags = vim.diagnostic.get(0, {
    lnum = vim.fn.line(".") - 1,
  })

  if #diags == 0 then
    vim.notify("No diagnostics", vim.log.levels.INFO)
    return
  end

  local msg = table.concat(
    vim.tbl_map(function(d)
      return d.message
    end, diags),
    "\n"
  )
  vim.fn.setreg("+", msg)
  vim.notify("Diagnostic copied")
end

vim.keymap.set(
  "n",
  "<leader>yd",
  copy_diagnostic_under_cursor,
  { desc = "Copy diagnostic under cursor" }
)
