return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- load only when you enter insert mode
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- enable Treesitter integration if available
      disable_filetype = { "TelescopePrompt", "vim" },
    })
  end,
}
