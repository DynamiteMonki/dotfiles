vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quick exit", silent = true })

-- buffer management
map("n", "<leader>bd", "<CMD>bdelte<CR>", { desc = "Buf del" })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Buf next" })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Buf prev" })
