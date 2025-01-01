vim.keymap.set("n", "<Leader>e", "<cmd>Oil --float<CR>", { desc = "Open Oil file manager" })

vim.keymap.set("n", "<Leader>th", "<cmd>Telescope themes<CR>", { desc = "Open theme selector" })

vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus window to the left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus window to the right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus window to the down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus window to the up" })
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Focus window to the left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Focus window to the right" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Focus window to the down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Focus window to the up" })

vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files using telescope" })
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find text using telescope live grep" })

vim.keymap.set("n", "<Leader>wch", "<cmd>WhichKey<cr>", { desc = "Open WhichKey" })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", direction = "float", hidden = true }

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Open LazyGit inside terminal" })
vim.keymap.set("n", "<leader>te", "<cmd>ToggleTerm<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<C-esc>", "<C-\\><C-N>", { desc = "Exit toggleterm" })

vim.keymap.set("n", "<leader>nk", ":nohl<CR>", { desc = "Clear search highlights" })
