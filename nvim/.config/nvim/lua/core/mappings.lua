-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- In visual mode, select text and then press <leader>y
map("v", "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })

-- In normal mode, press <leader>p
map("n", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })

