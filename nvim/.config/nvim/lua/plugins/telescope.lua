return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        winblend = 10,
        selection_caret = "▶ ",
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["n"] = actions.move_selection_next,
            ["t"] = actions.move_selection_previous,
          },
        },
      })
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files = {
          hidden = true,
          no_ignore = true,
          theme = "dropdown",
        },
        live_grep = {
          additional_args = function() return { "--hidden" } end,
        },
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find Hidden Files" },
      { "<leader>fw", ":lua require('telescope.builtin').live_grep({ additional_args = { '--hidden' } })<CR>", desc = "Live Grep Hidden Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    },
  },
  -- Extensions for beautiful UI
  { "nvim-telescope/telescope-ui-select.nvim", config = function() require("telescope").load_extension("ui-select") end },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", config = function() require("telescope").load_extension("fzf") end },
}

