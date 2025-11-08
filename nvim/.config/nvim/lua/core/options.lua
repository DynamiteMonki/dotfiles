vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8
vim.o.winborder = "rounded"
vim.o.winblend = 0
vim.o.wildoptions = "pum"
vim.o.background = "dark"
vim.o.expandtab = true

-- Persistent undo directory setup
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
