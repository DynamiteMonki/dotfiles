local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.winborder = "rounded"
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- mapping options
vim.g.mapleader = " "
