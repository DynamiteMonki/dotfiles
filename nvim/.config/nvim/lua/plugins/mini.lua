return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.pairs").setup()
      require("mini.tabline").setup()
      require("mini.statusline").setup()
      require("mini.icons").setup()
      require("mini.colors").setup()
      require("mini.comment").setup({
        options = {
          mappings = {
            comment_line = "<leader>/"
          }
        }
      })
    end,
  }
}
