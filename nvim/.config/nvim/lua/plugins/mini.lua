return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function ()
   require("mini.pairs").setup()
   require("mini.icons").setup()
   require("mini.tabline").setup()
   require("mini.statusline").setup()

   -- keymaps 
    vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
    vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })   
  end
}
