local map = vim.keymap.set 

-- Copy to system clipboard with <leader>y
-- Works in Normal and Visual modes
map({"n", "v"}, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)

-- Paste from system clipboard with <leader>p
map({"n", "v"}, "<leader>p", [["+p]], opts)

-- THE BEST MAPPING: Paste over currently selected text without yanking it
-- (Prevents the thing you just deleted from overwriting your clipboard)
map("v", "p", [["_dP]], opts)

-- Delete to void (doesn't overwrite clipboard)
map({"n", "v"}, "<leader>d", [["_d]], opts)

-- Map 'x' to delete character without yanking
-- (Standard 'x' puts the character in clipboard, which is usually annoying)
map("n", "x", [["_x]], opts)

-- Move to next/previous buffer with Shift + L / H
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Close current buffer with <leader>bd
map("n", "<leader>bd", ":bdelete<CR>", opts)
