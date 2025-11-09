return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

		capabilities = vim.tbl_deep_extend("force", capabilities, {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		})

		-- lua setup
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "Snacks" },
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- clangd setup
		vim.lsp.config("clangd", {
			capabilities = capabilities,
		})
		vim.lsp.enable("clangd")

		-- the go lang setup
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("gopls")

		-- python setup
		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
		})
		vim.lsp.enable("basedpyright")
	end,
}
