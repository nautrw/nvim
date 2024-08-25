require "nvchad.mappings"

-- add yours here

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

vim.keymap.set("i", "<A-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "move up" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>nk", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.del("n", "<leader>n")
