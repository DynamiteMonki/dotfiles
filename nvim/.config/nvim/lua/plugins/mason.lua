return {
  -- Mason: LSP / DAP / Formatter installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",      -- load when you run :Mason
    build = ":MasonUpdate", -- keep registry updated
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
        },
      })
    end,
  },

  -- Mason-LSPconfig bridge, but no auto-install
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Don’t set ensure_installed here!
        automatic_installation = false,
      })
    end,
  },
}
