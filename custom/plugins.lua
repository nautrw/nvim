local plugins = {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'pyright',
                'mypy',
                'ruff',
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
    }
}

return plugins
