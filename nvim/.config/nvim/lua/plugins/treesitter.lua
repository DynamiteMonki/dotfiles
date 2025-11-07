return {
  'nvim-treesitter/nvim-treesitter',
  -- The `build` step will run the `:TSUpdate` command to install and update parsers.
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
     -- Install parsers synchronously (only relevant for UI updates)
      sync_install = false,

      -- Automatically install missing parsers when entering a buffer
      auto_install = true,

      -- The main feature: syntax highlighting
      highlight = {
        enable = true,
      },

      -- Another great feature: smarter indentation
      indent = {
        enable = true,
      },
    })
  end,
}
