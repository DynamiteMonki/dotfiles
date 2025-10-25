require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep_buffers<cr>', { desc = 'Grep buffers' })

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer', silent = true })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer', silent = true })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer', silent = true })
