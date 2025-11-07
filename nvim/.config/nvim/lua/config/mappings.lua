local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap('n', '<leader>q', ":q<CR>", {desc = "Dine out!", silent = true})

-- Window navigation
-- Use Ctrl + h/j/k/l to move between split windows
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window', silent = true})
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to down window', silent = true })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to up window' , silent = true })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' , silent = true })

-- Buffer navigation
-- Use <leader>n for next buffer and <leader>p for previous buffer
keymap('n', '<leader>n', ':bnext<CR>', { desc = 'Next buffer' , silent = true })
keymap('n', '<leader>p', ':bprevious<CR>', { desc = 'Previous buffer' , silent = true })

-- Close buffer
keymap('n', '<leader>c', ':bdelete<CR>', { desc = 'Close current buffer', silent = true  })
-- Yank (copy) to clipboard
-- In visual mode, select text and press <leader>y
keymap('v', '<leader>y', '"+y', { desc = 'Yank to clipboard' , silent = true })
-- In normal mode, e.g., <leader>yy to copy the line
keymap('n', '<leader>y', '"+y', { desc = 'Yank to clipboard' , silent = true })

-- Paste from clipboard
-- In normal mode, press <leader>p to paste
keymap('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' , silent = true })
keymap('n', '<leader>P', '"+P', { desc = 'Paste from clipboard (before)' , silent = true })
