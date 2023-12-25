return {
    'folke/which-key.nvim',
    config = function()
        local wk = require('which-key')

        wk.register({
            ['<leader>'] = {
                e = {
                    name = '+explorer',
                    e = {'<cmd>NvimTreeFocus<cr>', 'Open the NvimTree and focus on it'},
                    t = {'<cmd>NvimTreeToggle<cr>', 'Toggle the NvimTree'}
                }
            }
        })
    end
}
