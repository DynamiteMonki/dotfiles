return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- LOGIC: Handling Dotfiles
			filters = {
				dotfiles = false, -- false means "do NOT filter dotfiles" (show them)
				custom = { "^.git$" }, -- explicitly hide the .git folder
			},
			git = {
				enable = true,
				ignore = false, -- Show files even if they are in .gitignore
				timeout = 500,
			},

			-- BEHAVIOR: Keep the tree in sync with your activity
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},

			-- AESTHETICS: Making it "Not Ugly"
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = true,
				number = false,
				relativenumber = false,
				signcolumn = "yes", -- Keep spacing consistent
			},

			renderer = {
				root_folder_label = false, -- Hide the ugly full path at top
				highlight_git = true, -- Color the files based on git status
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})

		-- Keymap to toggle the explorer
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end,
}
