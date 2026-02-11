return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require "telescope"

        telescope.setup {
            defaults = {
                prompt_prefix = "󰘧 ",
            },
        }
    end,
}
