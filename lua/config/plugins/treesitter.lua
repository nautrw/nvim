return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "python", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java" },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
        }
    end,
    build = function()
        require("nvim-treesitter.install").update { with_sync = true }()
    end,
}
