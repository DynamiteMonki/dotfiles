require("config.options")
require("config.mappings")

require("config.lazy")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Add to your colorscheme config
vim.cmd([[
  highlight NeoTreeNormal guibg=#1e1e2e
  highlight NeoTreeNormalNC guibg=#1e1e2e
  highlight NeoTreeFloatBorder guifg=#89b4fa guibg=#1e1e2e
  highlight NeoTreeFloatTitle guifg=#89b4fa guibg=#1e1e2e
]])
