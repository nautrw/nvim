return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    build = "cargo +nightly-2025-09-30 build --release",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
        keymap = { preset = "super-tab" },
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
