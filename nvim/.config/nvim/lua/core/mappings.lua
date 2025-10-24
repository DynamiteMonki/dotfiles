-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Clipboard operations
-- Copy to system clipboard
keymap("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })

-- Paste from system clipboard
keymap("n", "<leader>p", '"+p', { desc = "Paste from clipboard after cursor" })
keymap("n", "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })
keymap("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Optional: Some other useful mappings

-- Better paste in visual mode (doesn't yank replaced text)
keymap("v", "p", '"_dP', opts)

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete without yanking
keymap("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
keymap("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Save file
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Save file" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })
