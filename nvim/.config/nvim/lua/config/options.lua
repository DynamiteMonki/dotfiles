local opt = vim.opt 

-- options
opt.number = true
opt.relativenumber = true
opt.winborder = "rounded"
opt.swapfile = false
opt.signcolumn = "yes"
opt.wrap = false
opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- spaces 
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
