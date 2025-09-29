-- lua/myconfig/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true          -- show absolute line numbers
opt.relativenumber = true  -- relative line numbers for jumps

-- Tabs & indentation
opt.tabstop = 2            -- number of spaces a <Tab> counts for
opt.shiftwidth = 2         -- number of spaces for each indentation
opt.expandtab = true       -- convert tabs to spaces
opt.smartindent = true     -- smart autoindenting

-- Line wrapping
opt.wrap = false           -- don’t wrap long lines

-- Search
opt.ignorecase = true      -- ignore case when searching
opt.smartcase = true       -- but be smart: if uppercase used, respect it
opt.incsearch = true       -- show matches as you type

-- Appearance
opt.termguicolors = true   -- enable 24-bit colors
opt.cursorline = true      -- highlight current line
opt.signcolumn = "yes"     -- always show sign column
opt.scrolloff = 4          -- minimal number of lines around cursor

-- Splits
opt.splitbelow = true      -- horizontal splits below
opt.splitright = true      -- vertical splits to the right

-- Performance
opt.updatetime = 250       -- faster completion
opt.timeoutlen = 400       -- faster keymap timeout
