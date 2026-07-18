require("which-key").add({
  { "<leader>s", group = "Splits" },
  { "<leader>f", group = "Find, Format" },
  { "<leader>d", group = "Diagnostics, Dap" },
  { "<leader>t", group = "Theme, Terminal" },
  { "<leader>h", group = "Git" }
})

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

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<C-A-h>', '<C-w>>', { desc = "Increase split size to the right"})
vim.keymap.set('n', '<C-A-l>', '<C-w><', { desc = "Increase split size to the left"})
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus window to the left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus window to the right' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus window to the down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus window to the up' })

vim.keymap.set('n', '<leader>ff', "<cmd>lua Snacks.picker('files')<CR>", { desc = 'File picker' })
vim.keymap.set('n', '<leader>fe', '<cmd>lua Snacks.picker()<CR>', { desc = 'Every snacks picker' })
vim.keymap.set('n', '<leader>fu', "<cmd>lua Snacks.picker('undo')<CR>", { desc = 'Undo history picker' })
vim.keymap.set('n', '<leader>fg', "<cmd>lua Snacks.picker('grep')<CR>", { desc = 'Find text' })
vim.keymap.set('n', '<leader>fr', "<cmd>lua Snacks.picker('recent')<CR>", { desc = 'Pick recent files' })
vim.keymap.set('n', '<leader>fc', "<cmd>lua Snacks.picker('files', {cwd = vim.fn.stdpath('config')})<CR>", { desc = 'Find in Neovim config.' })
vim.keymap.set('n', '<leader>fp', '<cmd>lua Snacks.explorer()<CR>', { desc = "Traditional file explorer" })
vim.keymap.set('n', '<leader>fd', '<cmd>lua Snacks.picker.diagnostics_buffer()<CR>', { desc = "Diagnostics picker" })
vim.keymap.set('n', '<leader>fD', '<cmd>lua Snacks.picker.diagnostics()<CR>', { desc = "Diagnostics picker (whole workspace)" })

vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR>', { desc = 'Clear search highlights' })

vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'Ctrl+Backspace' })

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Show diagnostics in a float' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'View documentation of a symbol' })
vim.keymap.set('n', '<leader>dh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 }) end, { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open Oil file manager' })

vim.keymap.set('n', '<leader>th', "<cmd>lua require('utils.colorscheme_picker').picker()<CR>", { desc = 'Show colorscheme picker' })
vim.keymap.set('n', '<leader>p', "<cmd>lua require('utils.command_palette').picker()<CR>", { desc = 'Show colorscheme picker' })

vim.keymap.set('n', '<leader>tc', '<cmd>ColorizerToggle<CR>', { desc = 'Toggle colorizer' })

vim.keymap.set('n', '<leader>rr', '<cmd>mksession! /tmp/Session.vim | restart source /tmp/Session.vim<CR>', { desc = 'Restart neovim in place' })

vim.keymap.set('n', '<leader>vv', '<cmd>w<CR>', { desc = 'Alternate :w' })

vim.keymap.set('n', '<leader>fm', function() require('conform').format { async = true, lsp_fomat = 'fallback' } end, { desc = 'Format buffer' })

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', direction = 'float', hidden = true }

vim.keymap.set('t', '<C-Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>tg', function() lazygit:toggle() end, { desc = "Open Lazygit" })
vim.keymap.set('n', '<leader>te', "<cmd>ToggleTerm<CR>", { desc = "Open Terminal" })
vim.keymap.set({"n", "t"}, '<C-`>', '<cmd>ToggleTerm<CR>', { desc = "Open Terminal"})

vim.keymap.set("n", "gD", "<cmd>vsplit | lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
vim.keymap.set("n", "gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })

vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "View diff of hunk" })
