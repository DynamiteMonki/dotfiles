-- ~/.config/nvim/lua/user/keymaps.lua

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Yank to system clipboard
-- In visual mode, select text and then press <leader>y
map("v", "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })

-- Paste from system clipboard
-- In normal mode, press <leader>p
map("n", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move selected lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
