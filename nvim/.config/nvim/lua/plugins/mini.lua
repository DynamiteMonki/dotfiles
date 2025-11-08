return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("mini.tabline").setup()
		require("mini.pick").setup()
		require("mini.icons").setup()
		require("mini.colors").setup()
		require("mini.statusline").setup()

		-- keybindings for mini.pick
		vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Find files", silent = true })
		vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers<CR>", { desc = "Find buffers", silent = true })
		vim.keymap.set("n", "<leader>fg", "<CMD>Pick grep_live<CR>", { desc = "Live grep files", silent = true })
	end,
}
