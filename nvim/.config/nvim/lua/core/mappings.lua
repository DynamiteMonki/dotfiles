vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Exit out insert mode" })
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete the buffer", silent = true })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Move to next buffer", silent = true })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Move to previous buffer", silent = true })

map("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quick exit", silent = true })
