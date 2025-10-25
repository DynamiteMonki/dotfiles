return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          theme = "dropdown",
          previewer = false,
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            }
          }
        }
      }
    })
  end
}
