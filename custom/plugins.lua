local plugins = {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'pyright',
                'mypy',
                'ruff',
                'black'
            }
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.configs.lspconfig')
            require('custom.configs.lspconfig')
        end,
    },
    {
        'nvimtools/none-ls.nvim', -- Replacement for null-ls
        ft = { 'python' },
        config = function()
            return require('custom.configs.null-ls')
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                'python'
            },
        }
    }
}

return plugins
