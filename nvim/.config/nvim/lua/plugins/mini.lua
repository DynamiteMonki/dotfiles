return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
  end,
}
