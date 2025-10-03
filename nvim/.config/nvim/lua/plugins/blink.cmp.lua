return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = {
        preset = "none",

        ['<Tab>'] = {"select_and_accept", "fallback"},  -- Added comma
        ['<Enter>'] = { 'select_and_accept','fallback'},
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Esc>'] = { 'hide', 'fallback' },
        ['<C-e>'] = { 'hide' },
    },  -- Added comma
    
    appearance = {
      nerd_font_variant = 'mono'
    },  -- Added comma
    completion = { documentation = { auto_show = false } },  -- Added comma
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },  -- Added comma
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
