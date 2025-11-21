return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find todo", silent = true })
	end,
}
