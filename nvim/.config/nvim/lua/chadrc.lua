-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
-- local M = {}

-- M.base46 = {
-- theme = "onedark",

-- hl_override = {
-- Comment = { italic = true },
-- ["@comment"] = { italic = true },
-- },
-- }

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
-- tabufline = {
-- lazyload = false
-- }
-- }

-- return M

-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },

    -- Bold keywords and types
    Keyword = { bold = true },
    Conditional = { bold = true },
    Repeat = { bold = true },
    Label = { bold = true },
    Exception = { bold = true },
    Include = { bold = true },
    Define = { bold = true },
    Macro = { bold = true },
    PreProc = { bold = true },
    Type = { bold = true },
    StorageClass = { bold = true },
    Structure = { bold = true },
    Typedef = { bold = true },

    -- Treesitter highlights (if you use Treesitter)
    ["@keyword"] = { bold = true },
    ["@keyword.function"] = { bold = true },
    ["@keyword.operator"] = { bold = true },
    ["@keyword.return"] = { bold = true },
    ["@conditional"] = { bold = true },
    ["@repeat"] = { bold = true },
    ["@type"] = { bold = true },
    ["@type.builtin"] = { bold = true },
    ["@type.qualifier"] = { bold = true },
    ["@storageclass"] = { bold = true },
    ["@exception"] = { bold = true },
    ["@include"] = { bold = true },
    ["@function.macro"] = { bold = true },
    ["@constant.macro"] = { bold = true },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
-- tabufline = {
-- lazyload = false
-- }
-- }

return M
