vim.g.mapleader = " "
vim.g.maplocalleader = " " 

local map = vim.keymap.set 

map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quick exit", silent = true })
