vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "auto"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup("plugins")

require("diagnostic")
