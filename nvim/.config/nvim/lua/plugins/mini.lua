return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.pairs").setup()
			require("mini.icons").setup()
			require("mini.statusline").setup()
			require("mini.tabline").setup()
			require("mini.comment").setup({
				mappings = {
					comment_line = "<leader>/",
				},
			})
		end,
	},
}
