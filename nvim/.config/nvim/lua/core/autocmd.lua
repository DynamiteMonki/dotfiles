-- Place this in your init.lua or in a separate file like lua/config/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General settings group
local general = augroup("General", { clear = true })

-- =============================================================================
-- FILE MANAGEMENT
-- =============================================================================

-- Auto-create parent directories when saving a file
autocmd("BufWritePre", {
	group = general,
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Auto-save files when focus is lost
autocmd({ "FocusLost", "BufLeave" }, {
	group = general,
	pattern = "*",
	command = "silent! wa",
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
	group = general,
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- =============================================================================
-- UI IMPROVEMENTS
-- =============================================================================

-- Highlight yanked text briefly
autocmd("TextYankPost", {
	group = general,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
	group = general,
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter" }, {
	group = general,
	pattern = "*",
	command = "set cursorline",
})
autocmd({ "InsertEnter", "WinLeave" }, {
	group = general,
	pattern = "*",
	command = "set nocursorline",
})

-- Disable line numbers in terminal buffers
autocmd("TermOpen", {
	group = general,
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.cmd("startinsert")
	end,
})

-- =============================================================================
-- CODE EDITING
-- =============================================================================

-- Auto-format on save (for specific filetypes)
autocmd("BufWritePre", {
	group = general,
	pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json" },
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
	group = general,
	pattern = "*",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Set specific settings for certain filetypes
autocmd("FileType", {
	group = general,
	pattern = { "json", "jsonc", "yaml" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

autocmd("FileType", {
	group = general,
	pattern = { "go", "makefile" },
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

-- Auto-close brackets/quotes for specific filetypes
autocmd("FileType", {
	group = general,
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- =============================================================================
-- PERFORMANCE
-- =============================================================================

-- Disable certain features in large files
autocmd("BufReadPre", {
	group = general,
	pattern = "*",
	callback = function()
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
		if ok and stats and stats.size > max_filesize then
			vim.b.large_file = true
			vim.opt_local.syntax = "off"
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.spell = false
			vim.opt_local.swapfile = false
			vim.opt_local.undofile = false
			vim.opt_local.undolevels = -1
			vim.opt_local.undoreload = 0
			vim.opt_local.list = false
		end
	end,
})

-- =============================================================================
-- QUALITY OF LIFE
-- =============================================================================

-- Auto-close quickfix window when it's the last window
autocmd("WinEnter", {
	group = general,
	callback = function()
		if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
			vim.cmd("quit")
		end
	end,
})

-- Auto-update file if changed outside of Neovim
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = general,
	pattern = "*",
	command = "if mode() != 'c' | checktime | endif",
})

-- Show diagnostic popup on cursor hold
autocmd("CursorHold", {
	group = general,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- Create a scratch buffer
autocmd("BufEnter", {
	group = general,
	pattern = "*.scratch",
	callback = function()
		vim.bo.buftype = "nofile"
		vim.bo.bufhidden = "hide"
		vim.bo.swapfile = false
	end,
})

-- Auto-close help, man, and other special buffers with 'q'
autocmd("FileType", {
	group = general,
	pattern = { "help", "man", "lspinfo", "qf", "query", "scratch", "spectre_panel" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Auto-compile Packer when saving plugins file
autocmd("BufWritePost", {
	group = general,
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

-- =============================================================================
-- GIT SPECIFIC
-- =============================================================================

-- Highlight git conflict markers
autocmd("BufReadPost", {
	group = general,
	pattern = "*",
	callback = function()
		vim.fn.matchadd("ErrorMsg", "^<<<<<<< .*$")
		vim.fn.matchadd("ErrorMsg", "^>>>>>>> .*$")
		vim.fn.matchadd("ErrorMsg", "^=======$")
	end,
})

-- =============================================================================
-- PROJECT SPECIFIC
-- =============================================================================

-- Auto-reload config files on save
autocmd("BufWritePost", {
	group = general,
	pattern = vim.fn.expand("~") .. "/.config/nvim/*.lua",
	callback = function()
		vim.notify("Config reloaded!", vim.log.levels.INFO, { title = "Neovim" })
		vim.cmd("source %")
	end,
})

-- Auto-cd to project root (if using git)
autocmd({ "BufEnter", "BufWinEnter" }, {
	group = general,
	pattern = "*",
	callback = function()
		local root = vim.fn.finddir(".git", ".;")
		if root ~= "" then
			local project_root = vim.fn.fnamemodify(root, ":h")
			vim.cmd("lcd " .. project_root)
		end
	end,
})

-- =============================================================================
-- MARKDOWN SPECIFIC
-- =============================================================================

-- Auto-generate table of contents for markdown
autocmd("BufWritePre", {
	group = general,
	pattern = "*.md",
	callback = function()
		-- Only if file contains <!-- toc --> marker
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		for _, line in ipairs(lines) do
			if line:match("<!-- toc -->") then
				vim.cmd("silent! %s/<!-- toc -->.*<!-- tocstop -->/<!-- toc -->/")
				-- You'd implement TOC generation here
				break
			end
		end
	end,
})

-- =============================================================================
-- SESSION MANAGEMENT
-- =============================================================================

-- Auto-save session on exit
autocmd("VimLeavePre", {
	group = general,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("mksession! ~/.config/nvim/sessions/last-session.vim")
		end
	end,
})

-- Notification when file is read-only
autocmd("BufEnter", {
	group = general,
	pattern = "*",
	callback = function()
		if vim.bo.readonly then
			vim.notify("File is read-only!", vim.log.levels.WARN)
		end
	end,
})
