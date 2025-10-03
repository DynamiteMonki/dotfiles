return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move up
            ["<C-j>"] = actions.move_selection_next, -- move down
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- Enable the fzf native extension
    telescope.load_extension("fzf")

    -- Define keymaps
    local map = vim.keymap.set
    -- Find files using Telescope
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    -- Find files that are tracked by git
    map("n", "<leader>fG", builtin.git_files, { desc = "Find git files" })
    -- Find text in the current project
    map("n", "<leader>fg", builtin.live_grep, { desc = "Find text (live grep)" })
    -- Find text in the current buffer
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    -- Find Neovim help documentation
    map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    -- See git status
    map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
  end,
}
