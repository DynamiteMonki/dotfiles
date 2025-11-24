local map = vim.keymap.set

map("n", "<leader>o", "<CMD>restart<CR>", { desc = "Quick restart", silent = true })
map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit", silent = true })

-- Buffer management
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Del buf", silent = true })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buf", silent = true })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Prev buf", silent = true })
