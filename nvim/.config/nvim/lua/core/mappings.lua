vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leader>o", "<CMD>restart<CR>")

-- Yank to end of line (like D and C but for yanking)
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Paste without yanking the replaced text (pure bliss)
map("x", "p", '"_dP', { desc = "Paste without yanking" })
map("n", "<leader>p", '"_dP', { desc = "Paste without yanking (leader)" })
map("n", "<leader>P", '"_dP', { desc = "Paste without yanking (leader)" })

-- Optional god-tier addition: one-key copy current line/path/file to system clipboard
map("n", "<leader>y", function()
	local line = vim.api.nvim_get_current_line()
	vim.fn.setreg("+", line)
	print("Yanked line to clipboard")
end, { desc = "Yank current line to system clipboard" })

map("n", "<leader>Y", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Yanked file path: " .. path)
end, { desc = "Yank full file path to clipboard" })

-- Buffer management
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buf", silent = true })
map("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Del buf", silent = true })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Prev buf", silent = true })
