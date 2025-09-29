return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons", -- for icons
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level == vim.diagnostic.severity.ERROR and " " or " "
          return icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = " Files",
            highlight = "Directory",
            text_align = "left"
          }
        },
        separator_style = "slant", -- or "thin" | "thick"
        show_buffer_close_icons = true,
        show_close_icon = true,
        indicator = {
          style = "underline", -- subtle active tab indicator
        },
      },
      highlights = require("tokyonight").palette, -- Auto-match TokyoNight colors
    })

    -- Keymaps (VSCode-style)
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })
  end
}
