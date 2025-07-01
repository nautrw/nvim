header = {
    "Gloria al Padre, y al Hijo, y al Espíritu Santo;",
    "Como era en el principio, ahora, y siempre, por",
    "los siglos de los siglos.",
    "",
    "────── ✝ ──────",
    "",
    "Glory be to the Father, and to the Son, and to the",
    "Holy Spirit. As it was in the beginning, is now,",
    "and shall ever be, world without end.",
    "",
    "Amen.",
}

header_formatted = table.concat(header, "\n")
return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        bigfile = {
            enable = true,
            notify = true,
            size = 1 * 1024 * 1024,
            setup = function(ctx)
                if vim.fn.exists ":NoMatchParen" ~= 0 then
                    vim.cmd [[NoMatchParen]]
                end
                Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
                vim.b.minianimate_disable = true
                vim.schedule(function()
                    if vim.api.nvim_buf_is_valid(ctx.buf) then
                        vim.bo[ctx.buf].syntax = ctx.ft
                    end
                end)
            end,
        },
        indent = {
            enable = true,
            animate = {
                enabled = false,
            },
        },
        dashboard = {
            enabled = true,
            width = 60,
            row = nil,
            col = nil,
            pane_gap = 4,
            autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
            preset = {
                header = header_formatted,
                pick = nil,
                keys = {
                    {
                        icon = "󰏇",
                        key = "e",
                        desc = "Open Oil",
                        action = ":Oil",
                    },
                    {
                        icon = " ",
                        key = "f",
                        desc = "Find File",
                        action = ":lua Snacks.dashboard.pick('files')",
                    },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "t",
                        desc = "Theme Chooser",
                        action = ":Telescope colorscheme_chooser",
                    },
                    {
                        icon = "󰒲 ",
                        key = "L",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
