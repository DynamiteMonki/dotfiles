local opt = vim.o 

-- options
opt.number = true
opt.relativenumber = true
opt.winborder = "rounded"
opt.swapfile = false
opt.signcolumn = "yes"
opt.wrap = false
opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I")

-- spaces 
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
