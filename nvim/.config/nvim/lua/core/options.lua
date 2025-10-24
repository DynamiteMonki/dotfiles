local opt = vim.opt

-- Line Numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true         -- Show absolute line number on current line
opt.numberwidth = 4       -- Set number column width

-- Tabs & Indentation
opt.tabstop = 2           -- Number of spaces tabs count for
opt.shiftwidth = 2        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.autoindent = true     -- Copy indent from current line when starting new one
opt.smartindent = true    -- Insert indents automatically
opt.wrap = false          -- Disable line wrap

-- Search Settings
opt.ignorecase = true     -- Case insensitive searching
opt.smartcase = true      -- If you include mixed case, assumes case sensitive
opt.hlsearch = false      -- Don't highlight all search results
opt.incsearch = true      -- Show search matches as you type

-- Cursor Line
opt.cursorline = true     -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.signcolumn = "yes"    -- Always show sign column so text doesn't shift
opt.cmdheight = 1         -- More space for displaying messages
opt.showmode = false      -- Don't show mode since we have a statusline

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Backup & Undo
opt.swapfile = false      -- Don't create swapfile
opt.backup = false        -- Don't create backup file
opt.undofile = true       -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Performance
opt.updatetime = 50       -- Faster completion (4000ms default)
opt.timeoutlen = 500      -- Time to wait for a mapped sequence to complete

-- File Encoding
opt.encoding = "utf-8"    -- Set encoding to UTF-8
opt.fileencoding = "utf-8"

-- Miscellaneous
opt.iskeyword:append("-") -- Consider string-string as whole word
opt.mouse = "a"           -- Enable mouse support

