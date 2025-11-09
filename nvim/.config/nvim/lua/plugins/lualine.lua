return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- These are the separators used by NvChad
		local separartors = {
			left = "", -- Powerline symbol
			right = "", -- Powerline symbol
		}

		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = separartors,
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				always_divide_middle = true,
			},
			sections = {
				-- Left side of the statusline
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1, -- 1 = relative to project root
					},
				},

				-- Right side of the statusline (was previously in the winbar)
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},

			-- The sections below are now empty to disable them
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
