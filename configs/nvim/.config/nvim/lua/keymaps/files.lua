local function copy_to_clipboard(value, message, empty_message)
  if value == "" then
    vim.notify(empty_message, vim.log.levels.INFO)
    return
  end

  vim.fn.setreg("+", value)
  vim.notify(message, vim.log.levels.INFO)
end

local function current_file_name()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return ""
  end

  return vim.fn.fnamemodify(path, ":t")
end

local function current_file_path()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return ""
  end

  return vim.fn.fnamemodify(path, ":p")
end

vim.keymap.set("n", "<leader>yn", function()
  copy_to_clipboard(current_file_name(), "File name copied", "No file name for current buffer")
end, { desc = "Copy current file name" })

vim.keymap.set("n", "<leader>yp", function()
  copy_to_clipboard(current_file_path(), "File path copied", "No file path for current buffer")
end, { desc = "Copy current file path" })
