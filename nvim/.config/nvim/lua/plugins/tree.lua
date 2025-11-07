return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Make sure this is here!
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- First, setup nvim-web-devicons
		require("nvim-web-devicons").setup({
			override = {},
			default = true,
		})

		require("neo-tree").setup({
			close_if_last_window = false,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			window = {
				position = "float",
				popup = {
					size = {
						height = "85%",
						width = "50%",
					},
					position = {
						row = "5%",
						col = "50%",
					},
				},
			},

			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},

			vim.keymap.set("n", "<leader>e", "<CMD>Neotree<CR>", { desc = "File explorer", silent = true }),
		})
	end,
}
