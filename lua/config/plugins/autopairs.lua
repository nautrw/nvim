return {
    'saghen/blink.pairs',
    version = '*',
    event = "InsertEnter",
    dependencies = {
        {
            'saghen/blink.download',
            event = "InsertEnter"
        }
    },
    opts = {
        mappings = {
            enabled = true,
            cmdline = true,
            disabled_filetypes = {},
            pairs = {},
        },
        highlights = {
            enabled = false,
            cmdline = false,
        },
        debug = false,
    }
}
