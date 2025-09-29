return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Saghen/blink.cmp",
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          {
            path = "${3rd}/luv/library", words = { "vim%.uv" },
          },
        },
      },
    },
    config = function()

      -- Completions 
      local capabilites = require("blink-cmp").get_lsp_capabilities()

      -- lua_ls config to fix "vim" issue
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        capabilites = capabilites,
      })

      vim.lsp.config('gopls', {
        capabilites = capabilites,
      })

      vim.lsp.config('pyright', {
        capabilites = capabilites,
      })

      vim.lsp.config('clangd', {
        capabilites = capabilites
      })

      vim.lsp.enable({ "lua_ls", "gopls", "pyright", "clangd"})
    end,
  },
}

