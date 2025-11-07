return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, for file icons
  },
  config = function()
    -- Disable netrw which is the default file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set up nvim-tree
    require('nvim-tree').setup({
      -- Options go here. For now, we'll use defaults.
      -- See :help nvim-tree.setup for more options.
    })

    -- Keymap to toggle the file explorer
    local keymap = vim.keymap.set
    keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
  end,
}
