return {
	"folke/which-key.nvim",
	tag = "v2.1.0", -- Pin to v2
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({})
	end,
}
