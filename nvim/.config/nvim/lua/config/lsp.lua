-- Called when LSP attaches to a buffer
local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
	end

	-- Info & navigation
	map("n", "K", vim.lsp.buf.hover) -- Hover docs
	map("n", "gd", vim.lsp.buf.definition) -- Go to definition
	map("n", "gD", vim.lsp.buf.declaration) -- Go to declaration
	map("n", "gi", vim.lsp.buf.implementation) -- Go to implementation
	map("n", "gr", vim.lsp.buf.references) -- List references

	-- Workspace
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)

	-- Code actions & diagnostics
	map("n", "<leader>ca", vim.lsp.buf.code_action) -- Code action
	map("n", "<leader>rn", vim.lsp.buf.rename) -- Rename symbol
	map("n", "<leader>e", vim.diagnostic.open_float) -- Show diagnostic popup
	map("n", "[d", vim.diagnostic.goto_prev) -- Prev diagnostic
	map("n", "]d", vim.diagnostic.goto_next) -- Next diagnostic

	-- Formatting
	map("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end)

	-- Signature help
	map("i", "<C-k>", vim.lsp.buf.signature_help)
end

return on_attach
