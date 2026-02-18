return {
    "luukvbaal/statuscol.nvim",
    event = "BufEnter",
    config = function()
        -- Custom function to show both absolute and relative line numbers
        local function lnum_both(args)
            return string.format("%3d %2d", args.lnum, args.relnum)
        end
        require("statuscol").setup {
            setopt = true,
            ft_ignore = {
                "dap-repl",
                "dapui_scopes",
                "dapui_breakpoints",
                "dapui_stacks",
                "dapui_console",
                "dapui_watches",
            },
            segments = {
                -- Gitsigns
                {
                    sign = {
                        namespace = { "gitsigns.*" }, -- only Git signs
                        name = { "gitsigns.*" }, -- only Git signs
                    },
                },
                -- Line number
                {
                    text = { lnum_both, " " },
                    condition = { true },
                    click = "v:lua.ScLa",
                },
                -- Diagnostics
                {
                    sign = {
                        namespace = { ".*" },
                        name = { ".*" },
                        -- maxwidth = 2,
                        auto = true,
                    },
                },
            },
        }
    end,
}
