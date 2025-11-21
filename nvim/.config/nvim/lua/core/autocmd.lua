local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 1. THE FLASH: Highlight text when you yank (copy) it
-- This is the #1 visual feedback feature. It flashes the text so you know you copied it.
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch", -- Colors the selection like a search result
			timeout = 40, -- Fast flash (40ms)
		})
	end,
})

-- 2. THE MEMORY: Restore cursor to the last position
-- When you reopen a file, jump instantly to where you left off.
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- 3. THE CHAMELEON: Smart Relative Line Numbers
-- "Relative" numbers are great for jumping, "Absolute" are great for knowing where you are.
-- This toggles them automatically:
--   - Relative in Normal Mode (easy movement)
--   - Absolute in Insert Mode (easy reading)
local number_group = augroup("NumberToggle", {})
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = number_group,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = number_group,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

-- 4. THE SANITY SAVER: Stop auto-commenting new lines
-- Prevents Neovim from adding a comment character when you hit <Enter> on a comment line.
autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- 5. THE CLEANER: Remove trailing whitespace on save
-- Automatically strips invisible whitespace at the end of lines when you save.
autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- 6. THE SPEEDSTER: Close annoying windows with 'q'
-- Normally you have to type :q to close Help, Man pages, or LSP info. This maps 'q' to close them.
autocmd("FileType", {
	pattern = {
		"help",
		"lspinfo",
		"man",
		"plenary",
		"qf",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- conform
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
