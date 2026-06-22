vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

vim.keymap.set("n", "<leader>dd", "<cmd>RustLsp debuggables<cr>", {
  buffer = true,
  desc = "Debug Rust target",
})

vim.keymap.set("n", "<leader>dD", "<cmd>RustLsp! debuggables<cr>", {
  buffer = true,
  desc = "Rerun last Rust target",
})
