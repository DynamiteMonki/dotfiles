return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			-- 1. THE FLOAT CONFIGURATION
			view = {
				-- This makes it a "separate window" floating on top
				float = {
					enable = true,
					quit_on_focus_loss = true, -- Close explorer if you click outside it
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * 0.5 -- Width: 50% of screen
						local window_h = screen_h * 0.8 -- Height: 80% of screen
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

						return {
							border = "rounded", -- Rounded corners
							relative = "editor",
							row = center_y,
							col = center_x,
							width = math.floor(window_w),
							height = math.floor(window_h),
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * 0.5)
				end,
			},

			-- 2. BEHAVIOR
			-- Close the tree automatically after you pick a file
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},

			-- 3. LOGIC: Handling Dotfiles (Same as before)
			filters = {
				dotfiles = false, -- SHOW dotfiles
				custom = { "^.git$" }, -- HIDE the .git folder
			},
			git = {
				enable = true,
				ignore = false,
			},

			-- 4. AESTHETICS (Clean Renderer)
			renderer = {
				root_folder_label = false,
				highlight_git = true,
				indent_markers = { enable = true },
				icons = {
					glyphs = {
						default = "󰈚",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
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

		-- Toggle Keybind
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Floating Explorer" })
	end,
}
