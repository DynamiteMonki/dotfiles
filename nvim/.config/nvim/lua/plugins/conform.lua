return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        python = { "black" },
        rust = { "rustfmt" },
        cpp = { "clang-format" },
      },
    },
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, {
        desc = "Format file or range",
      })
    end,
  },
}
