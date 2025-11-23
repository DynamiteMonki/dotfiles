return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },

  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
  },
}
