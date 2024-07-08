require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Move with hjkl in insert mode
map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")
map("i", "<M-l>", "<Right>")

-- Lazygit
map("n", "<Leader>gg", "<cmd>LazyGit<cr>")
