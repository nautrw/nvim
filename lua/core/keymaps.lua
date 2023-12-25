local keymap = vim.api.nvim_set_keymap
local expr_opts = { noremap = true, expr = true, silent = true }

local keymapsList = {
    {
        'n', '<leader>ee', ':NvimTreeFocus<CR>', 'Open the NvimTree and focus on it',
    },
    {
        'n', '<leader>et', ':NvimTreeToggle<CR>', 'Toggle the NvimTree'
    },
    {'i', '<A-h>', '<Left>', 'Move left in insert mode'},
    {'i', '<A-j>', '<Down>', 'Move down in insert mode'},
    {'i', '<A-k>', '<Up>', 'Move up in insert mode'},
    {'i', '<A-l>', '<Right>', 'Move right in insert mode'}
}

for _, mapping in ipairs(keymapsList) do
    keymap(mapping[1], mapping[2], mapping[3], { desc = mapping[4] })
end
