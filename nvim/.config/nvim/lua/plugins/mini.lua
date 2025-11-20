return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.statusline").setup()
		require("mini.tabline").setup()
		require("mini.ai").setup()
		require("mini.icons").setup()
	end,
}
