local opt = vim.opt 

opt.number = true
opt.relativenumber = true
opt.winborder = "rounded"
opt.signcolumn = "yes"
opt.undofile = true
opt.swapfile = false
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.undodir = vim.fn.stdpath("data") .. "/undodir"

