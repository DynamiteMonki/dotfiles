return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- for icons
  event = "VeryLazy", -- lazy load on UI event
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- matches your tokyonight theme
        globalstatus = true,  -- one unified statusline across splits
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } }, -- show mode + nice icon
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- show relative path
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "fugitive", "nvim-tree" },
    })
  end,
}
