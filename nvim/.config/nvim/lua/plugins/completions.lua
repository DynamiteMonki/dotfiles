return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
      },

      ghost_text = { enabled = true },

      signature = { enabled = true },

      completion = { documentation = { auto_show = true } },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
