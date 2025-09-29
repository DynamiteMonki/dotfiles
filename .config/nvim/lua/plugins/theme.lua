return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = ture  },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd("colorscheme tokyonight")
        end
    }
}
