-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness
-- Normal mode --
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save & quit" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Easier resize
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Insert mode --
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Visual mode --
keymap.set("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap.set("v", ">", ">gv", { desc = "Stay in indent mode" })

-- Move selected text up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Yank (copy) to system clipboard
keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })

-- Yank entire file
keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank whole file to system clipboard" })

-- Paste from system clipboard
keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- formatting
keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { desc = "Format a file using lsp", noremap = true, silent = true })
