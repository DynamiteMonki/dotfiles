vim.diagnostic.config({
	virtual_text = {
		-- Customize the prefix for each severity
		prefix = "→", -- Or '‣', '→', etc.
		-- Customize the format of the message
		format = function(diagnostic)
			-- Show only the message, not the source (e.g., '[eslint]')
			return diagnostic.message
		end,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local signs = {
	Error = " ", -- Assumes Nerd Font for this one
	Warn = " ", -- Assumes Nerd Font for this one
	Info = " ", -- Assumes Nerd Font for this one
	Hint = "→ ", -- SAFE: This is a standard Unicode arrow
}

-- local signs = { Error = "E ", Warn = "W ", Info = "I ", Hint = "→ " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
