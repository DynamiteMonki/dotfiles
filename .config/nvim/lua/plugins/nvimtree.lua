return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- grab latest stable
  lazy = false,  -- load immediately (since it’s core navigation)
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    -- Recommended setup
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
    })

    -- Keybindings (NVChad style)
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", noremap = true, silent = true })
  end,
}
