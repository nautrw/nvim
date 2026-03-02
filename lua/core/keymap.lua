-- Better up (k)/down (j)
-- ('x' mode is visual)
-- This allows for stuff like `10j` to work normally but just pressing `j` will do `gk`
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

vim.keymap.set('i', '<A-h>', '<Left>', { desc = 'Move cursor left' })
vim.keymap.set('i', '<A-l>', '<Right>', { desc = 'Move cursor right' })
vim.keymap.set('i', '<A-j>', '<Down>', { desc = 'Move cursor down' })
vim.keymap.set('i', '<A-k>', '<Up>', { desc = 'Move cursor up' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus window to the left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus window to the right' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus window to the down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus window to the up' })

vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker('files')<CR>", { desc = "File picker" })
vim.keymap.set("n", "<leader>fe", "<cmd>lua Snacks.picker()<CR>", { desc = "Every snacks picker" })
vim.keymap.set("n", "<leader>fu", "<cmd>lua Snacks.picker('undo')<CR>", { desc = "Undo history picker" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker('grep')<CR>", { desc = "Find text" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker('recent')<CR>", { desc = "Pick recent files" })
vim.keymap.set(
    "n",
    "<leader>fc",
    "<cmd>lua Snacks.picker('files', {cwd = vim.fn.stdpath('config')})<CR>",
    { desc = "Pick files in Neovim Configuration" }
)

vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR>', { desc = 'Clear search highlights' })

vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'Ctrl+Backspace' })

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostics in a float' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil file manager" })
