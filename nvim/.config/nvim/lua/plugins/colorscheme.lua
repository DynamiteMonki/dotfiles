return {
	"Shatur/neovim-ayu",
	config = function ()
		local color = require("ayu.colors")
		color.generate(true)
		vim.cmd("colorscheme ayu")
	end
}
