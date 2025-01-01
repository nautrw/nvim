return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')

        telescope.setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })

        telescope.load_extension('themes')
    end,
}
