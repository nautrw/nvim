return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        require("oil").setup({
            columns = {
                "icon",
                "mtime"
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            float = {
                padding = 5,
                max_width = 0,
                max_height = 0,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            }
        })
    end,
}
