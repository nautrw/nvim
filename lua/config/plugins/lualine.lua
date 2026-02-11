return {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local lualine = require "lualine"

        local mode = "mode"
        local location = "location"
        local filetype = { "filetype", icon_only = false }
        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        }
        local filename = {
            "filename",
            path = 1,
        }

        local diff = {
            "diff",
            source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                    return {
                        added = gitsigns.added,
                        modified = gitsigns.changed,
                        removed = gitsigns.removed,
                    }
                end
            end,
            colored = true,
            always_visible = false,
        }

        lualine.setup {
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = "",
                component_separators = "",
                disabled_filetypes = { statusline = { "snacks_dashboard", "lazy", "alpha" } },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { filename },
                lualine_c = { diff, diagnostics },
                lualine_x = { location, filetype },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
