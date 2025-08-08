return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require "telescope"

        telescope.setup {
            defaults = {
                prompt_prefix = "󰘧 ",
            },
        }

        telescope.load_extension "colorscheme_chooser"
    end,
}
