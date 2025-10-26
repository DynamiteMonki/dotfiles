require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "lua_ls", "basedpyright", "clangd", "rust_analyzer", "bacon_ls", "gopls"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
