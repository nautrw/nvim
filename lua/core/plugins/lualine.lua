return {
    'nvim-lualine/lualine.nvim',
    requires = {
        'nvim-tree/nvim-web-devicons',
        opt = true,
    },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
            },
            sections = {
                -- Left
                lualine_a = {'mode'},
                lualine_b = {'filename'},
                lualine_c = {
                    'branch', 
                    {
                        'diff', 
                        symbols = {
                            added    = " ",
                            modified = " ",
                            removed  = " "
                        },
                    },
                    {
                        "diagnostics",
                        sources =  {"nvim_lsp"},
                        sections = {"error", "warn", "info", "hint"},
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                    },
                },

                -- Right
                lualine_x = {'location'},
                lualine_y = {'encoding', 'fileformat'},
                lualine_z = {'filetype'},
            }
        })
    end
}
