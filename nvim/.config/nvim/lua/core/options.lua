local opt = vim.opt

-- UI & Appearance
opt.number = true                -- Show line numbers
opt.relativenumber = true        -- Relative line numbers
opt.termguicolors = true         -- True color support
opt.signcolumn = "yes"           -- Always show sign column
opt.cursorline = true            -- Highlight current line
opt.scrolloff = 8                -- Lines of context
opt.sidescrolloff = 8            -- Columns of context
opt.wrap = false                 -- No line wrap
opt.showmode = false             -- Don't show mode (status line does this)
opt.pumheight = 10               -- Popup menu height
opt.conceallevel = 0             -- So that `` is visible in markdown files

-- Line Numbers & Ruler
opt.ruler = true
opt.numberwidth = 4

-- Search
opt.ignorecase = true            -- Ignore case in search
opt.smartcase = true             -- Unless uppercase is used
opt.hlsearch = true              -- Highlight search results
opt.incsearch = true             -- Incremental search

-- Indentation
opt.tabstop = 2                  -- Number of spaces tabs count for
opt.softtabstop = 2
opt.shiftwidth = 2               -- Size of an indent
opt.expandtab = true             -- Use spaces instead of tabs
opt.smartindent = true           -- Insert indents automatically
opt.autoindent = true

-- Splits
opt.splitright = true            -- Vertical split to the right
opt.splitbelow = true            -- Horizontal split below

-- Clipboard
opt.clipboard = "unnamedplus"    -- Use system clipboard

-- Mouse
opt.mouse = "a"                  -- Enable mouse mode

-- Files & Backups
opt.backup = false               -- Don't create backup files
opt.writebackup = false
opt.swapfile = false             -- Don't create swap files
opt.undofile = true              -- Persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Performance
opt.updatetime = 250             -- Faster completion (default: 4000ms)
opt.timeoutlen = 300             -- Time to wait for mapped sequence
opt.lazyredraw = false           -- Don't redraw while executing macros

-- Editing
opt.backspace = { "indent", "eol", "start" }
opt.iskeyword:append("-")        -- Treat dash as part of word

-- Folding (if you use it)
opt.foldmethod = "manual"
opt.foldlevel = 99

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Miscellaneous
opt.hidden = true                -- Enable background buffers
opt.history = 100                -- Command history
opt.synmaxcol = 240              -- Max column for syntax highlight
opt.shortmess:append("c")        -- Don't pass messages to ins-completion-menu
