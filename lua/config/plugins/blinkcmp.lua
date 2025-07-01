return {
    "saghen/blink.cmp",
    version = "1.*",
    build = "cargo build --release",
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
