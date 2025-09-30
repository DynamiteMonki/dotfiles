return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities()
		)

		-- Example: Clangd for C/C++
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.enable("clangd")

		-- Lua - lua_ls
		vim.lsp.config("lua_ls", {
			settings = { Lua = { diagnostics = { globals = { "vim" } } } },
		})
		vim.lsp.enable("lua_ls")

		-- GO - gopls
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("gopls")
	end,
}
