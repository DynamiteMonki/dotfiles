return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
			},
		})
		-- autocmd
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set("n", "<leader>f", function(args)
			require("conform").format({ bufnr = args.buf })
		end, { desc = "Format a file" })
	end,
}
