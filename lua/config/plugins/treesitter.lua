return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'python', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
            sync_install = true,
            auto_install = true,
        })
    end,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

