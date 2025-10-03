return {
	{
		"nvim-mini/mini.nvim",
		config = function()
			require("mini.pairs").setup()
			require("mini.icons").setup()
			require("mini.comment").setup({
				mappings = {
					comment_line = "<leader>/",
				},
			}, require("mini.tabline").setup())
		end,
	},
}
