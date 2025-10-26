local options = {
  formatters_by_ft = {
    rust = { "rustfmt" },
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "gofumpt", "goimports" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
