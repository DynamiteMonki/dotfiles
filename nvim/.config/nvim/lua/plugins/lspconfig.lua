return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "Snacks" },
          },
        },
      },
      capabilities = capabilities,
    })
    vim.lsp.enable("lua_ls", true)

    -- the c/c++ config
    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })
    vim.lsp.enable("clangd", true)

    -- the rust config
    vim.lsp.config("rust-analyzer", {
      capabilities = capabilities,
    })
    vim.lsp.enable("rust-analyzer", true)
    vim.lsp.config("bacon-ls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("bacon-ls", true)

    -- the python config
    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })
    vim.lsp.enable("pyright", true)

  end,
}
