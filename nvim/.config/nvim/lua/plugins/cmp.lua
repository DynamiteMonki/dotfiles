return {
	"Saghen/blink.cmp",
	version = "1.*", -- stable tagged release, includes prebuilt fuzzy binaries
	opts = {
		keymap = {
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		completion = {
			menu = {
				border = "rounded",
				min_width = 20,
				max_height = 10,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		-- Blink sources
		sources = {
			default = { "lsp", "path", "buffer" },
		},
	},
}
