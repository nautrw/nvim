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

vim.keymap.set("n", "<leader>c", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Ctrl+Backspace" })

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil" })
