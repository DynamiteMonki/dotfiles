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

    -- the javascript/typescript config
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("ts_ls", true)

    -- svelte config
    vim.lsp.config("svelte", {
      capabilities = capabilities,
    })
    vim.lsp.enable("svelte", true)

    -- eslint for better linting
    vim.lsp.config("eslint", {
      capabilities = capabilities,
    })
    vim.lsp.enable("eslint", true)

    -- emmet for html/css snippets
    vim.lsp.config("emmet_language_server", {
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascriptreact",
        "typescriptreact",
        "svelte",
      },
    })
    vim.lsp.enable("emmet_language_server", true)

  end,
}
