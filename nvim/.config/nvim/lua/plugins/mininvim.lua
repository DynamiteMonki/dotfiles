return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.pairs").setup()
      require("mini.icons").setup()
      require("mini.colors").setup()
      require("mini.comment").setup({
        mappings = {
          comment_line = "<C-/>",
        },
      })
    end,
  },
}
