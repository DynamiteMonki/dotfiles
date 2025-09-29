return {
  "numToStr/Comment.nvim",
  event = "BufReadPre", -- load on file open
  config = function()
    require('Comment').setup({
      -- Add any custom options here (optional)
      toggler = {
        line = '<C-/>',    -- Toggle line comment (like VSCode)
        block = '<C-S-/>', -- Toggle block comment
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      padding = true, -- Add space after comment symbol
      sticky = true,  -- Keep cursor position
    })

    -- Optional: VSCode-style keymap (works everywhere)
    vim.keymap.set("n", "<C-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
      { desc = "Toggle Line Comment" })
    vim.keymap.set("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle Visual Comment" })
  end
}
