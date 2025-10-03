return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilites = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				capabilites = capabilites,
			})

			vim.lsp.config("gopls", { capabilites = capabilites })
			vim.lsp.config("clangd", { capabilites = capabilites })
			vim.lsp.enable("lua_ls", "gopls", "clangd")
		end,
	},
}
