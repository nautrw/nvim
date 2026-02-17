return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    build = "cargo +nightly-2025-09-30 build --release",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
        keymap = {
            preset = "none",
            ['<S-Tab>'] = { "accept", "fallback" },
            ['<Tab>'] = { "select_next", "fallback" },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
            ['<C-b>'] = { 'scroll_documentation_up' },
            ['<C-f>'] = { 'scroll_documentation_down' },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = {
                auto_show = true,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
