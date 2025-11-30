-- Copy to system clipboard with <leader>y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from system clipboard with <leader>p
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])

-- Buffer management 
local map = vim.keymap.set

map("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit", silent = true })
map("n", "<leader>bd", "<CMD>bdelete<CR>", {desc = "Del Buf", silent = true})
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Prev Buf", silent = true })
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next Buf", silent = true })
