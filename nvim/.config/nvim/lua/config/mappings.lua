-- Copy to system clipboard with <leader>y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from system clipboard with <leader>p
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
