-- ~/.config/nvim/lua/user/options.lua

local opt = vim.opt -- for conciseness

-- Line Numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- Tabs & Indentation
opt.tabstop = 2      -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2   -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- File & Backup
opt.swapfile = false -- don't create a swapfile
opt.backup = false   -- don't create a backup file
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true  -- enable persistent undo

-- Search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- Appearance
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.background = "dark"  -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"   -- always show the sign column, otherwise it would shift the text

-- Behavior
opt.clipboard = "unnamedplus" -- use system clipboard as default register
opt.mouse = "a"               -- enable mouse support
opt.splitright = true         -- force all vertical splits to go to the right
opt.splitbelow = true         -- force all horizontal splits to go to the bottom

-- Performance
opt.updatetime = 250 -- decrease update time
opt.timeoutlen = 300 -- shorten key timeout length
