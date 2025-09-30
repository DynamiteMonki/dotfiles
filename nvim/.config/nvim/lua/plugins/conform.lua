return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- load only when writing files
	cmd = { "ConformInfo" }, -- or call manually
	opts = {
		-- Formatters per filetype
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		-- Autoformat on save
		format_on_save = {
			lsp_fallback = true, -- fallback to LSP formatting if formatter not found
			async = false,
			timeout_ms = 1000,
		},
	},
}
