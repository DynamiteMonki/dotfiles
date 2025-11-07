-- ~/.config/nvim/lua/options.lua

local opt = vim.opt

-----------------------------------------------------------
-- Indentation & UI
-----------------------------------------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8

-----------------------------------------------------------
-- Behavior
-----------------------------------------------------------
opt.hidden = true -- Essential for buffer/tabline management
opt.wrap = false
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.clipboard = 'unnamedplus'

-----------------------------------------------------------
-- Native Tabline Configuration
-----------------------------------------------------------

-- This is a global function that Neovim can call to build the tabline string.
-- We attach it to the `_G` (global) table so the `opt.tabline` setting can find it.
_G.build_native_tabline = function()
  local tabline_parts = {}
  local current_buf = vim.fn.bufnr()

  -- `getbufinfo` gives us a list of all buffers that are "listed" (i.e., real files)
  for i, buf in ipairs(vim.fn.getbufinfo({ buflisted = true })) do
    -- Highlight for the current buffer
    if buf.bufnr == current_buf then
      table.insert(tabline_parts, '%#TabLineSel#') -- Use 'selected tab' highlight
    else
      table.insert(tabline_parts, '%#TabLine#') -- Use 'normal tab' highlight
    end

    -- Set the tab number, making it clickable (e.g., `3gt` goes to the 3rd tab)
    table.insert(tabline_parts, string.format('%%%dT', i))

    -- Get just the filename from the path
    local filename = vim.fn.fnamemodify(buf.name, ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    table.insert(tabline_parts, ' ' .. filename .. ' ')

    -- Add a '+' if the buffer is modified (has unsaved changes)
    if buf.changed then
      table.insert(tabline_parts, '%#TablineSel#') -- Use a standout color
      table.insert(tabline_parts, '[+] ')
      table.insert(tabline_parts, '%#TabLine#')
    end
  end

  -- Add a final "fill" element to take up the rest of the space
  table.insert(tabline_parts, '%#TabLineFill#%T')

  return table.concat(tabline_parts, '')
end

-- Set Neovim to always show the tabline and use our Lua function to build it
opt.showtabline = 2 -- 0: never, 1: if more than one tab, 2: always
opt.tabline = '%!v:lua._G.build_native_tabline()' -- Tell nvim to run our function

