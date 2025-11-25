local map = vim.keymap.set

map("n", "<leader>o", "<CMD>restart<CR>", { desc = "Quick restart", silent = true })
map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit", silent = true })

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste before from clipboard" })

-- Delete without yanking (send to black hole register)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

-- Paste over selection without losing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting" })

-- Buffer management
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Del buf", silent = true })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buf", silent = true })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Prev buf", silent = true })
