return {
	"MagicDuck/grug-far.nvim",
	-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
	-- additional lazy config to defer loading is not really needed...
	config = function()
		-- optional setup call to override plugin options
		-- alternatively you can set options with vim.g.grug_far = { ... }
		require("grug-far").setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})
		vim.keymap.set({ "n", "x" }, "<leader>ss", function()
			local search = vim.fn.getreg("/")
			-- surround with \b if "word" search (such as when pressing `*`)
			if search and vim.startswith(search, "\\<") and vim.endswith(search, "\\>") then
				search = "\\b" .. search:sub(3, -3) .. "\\b"
			end
			require("grug-far").open({
				prefills = {
					search = search,
				},
			})
		end, { desc = "grug-far: Search using @/ register value or visual selection" })
	end,
}
