vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Keymaps
local map = vim.keymap.set

-- Save & quit
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit file" })

-- Clipboard shortcuts
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
map("n", "<leader>p", [["+p]], { desc = "Paste from clipboard" })
map("n", "<leader>P", [["+P]], { desc = "Paste before (clipboard)" })

-- File explorer shortcut
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

