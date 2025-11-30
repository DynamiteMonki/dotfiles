return {
	"nvim-mini/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.pick").setup()
		require("mini.pairs").setup()
		require("mini.statusline").setup()
		require("mini.tabline").setup()

		-- mappings for the Picker 
		local map = vim.keymap.set
		map("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Pick files", silent = true })
		map("n", "<leader>fw", "<CMD>Pick grep_live<CR>", { desc = "Pick grep", silent = true })
		map("n", "<leader>fb", "<CMD>Pick buffers<CR>", { desc = "Pick buffer", silent = true })
		map("n", "<leader>fh", "<CMD>Pick help<CR>", { desc = "Pick help", silent = true })
	end,
}
