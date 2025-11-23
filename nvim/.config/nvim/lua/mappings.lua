require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>o", "<CMD>restart<CR>")

-- Buffer management 
map("n", "<leader>bd", "<CMD>bdelete<CR>", {desc = "Del buf", silent = true})
map("n", "<leader>bn", "<CMD>bnext<CR>", {desc = "Next buf", silent = true})
map("n", "<leader>bp", "<CMD>bprevious<CR>", {desc = "Prev buf", silent = true})
