local map = vim.keymap.set

map("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick files", silent = true })
map("n", "<leader>fb", "<CMD>Pick buffers<CR>", { desc = "Pick buffers", silent = true })
map("n", "<leader>fd", "<CMD>Pick grep_live<CR>", { desc = "Live grep", silent = true })
map("n", "<leader>h", "<CMD>Pick help<CR>", { desc = "Find help", silent = true })

-- buffer management
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete the buffer", silent = true })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Move to next buffer", silent = true })
