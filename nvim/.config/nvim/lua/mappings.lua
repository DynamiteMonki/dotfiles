require "nvchad.mappings"

-- add yours here

local keymap = vim.keymap.set

keymap("n", ";", ":", { desc = "CMD enter command mode" })
keymap("i", "jk", "<ESC>")

keymap({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- More intuitive split opening
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- "Split Vertical"
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- "Split Horizontal"

-- Easier window navigation
-- This is a game-changer: allows you to move between windows using Ctrl + hjkl
-- without having to press Ctrl-w first.
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to the top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })

keymap("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete the current buffer.", silent = true })
keymap("n", "<leader>q", "<CMD>q<CR>", { desc = "Quickly get out", silent = true, noremap = true })
