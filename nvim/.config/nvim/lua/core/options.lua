-- options file
vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.wrap = false
vim.o.cmdheight = 1

vim.o.hidden = true
vim.o.updatetime = 300
vim.o.winborder = "rounded"

vim.o.guicursor = "a:block"
-- Persistent undo directory setup
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

vim.o.conceallevel = 2
