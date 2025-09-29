return {
  "Saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
