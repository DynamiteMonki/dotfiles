return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      explorer = { enabled = true },
    },
    keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    },
  },
}
