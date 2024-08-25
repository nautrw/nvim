require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "<A-h>", "<Left>", { desc = "move left" })
map("i", "<A-l>", "<Right>", { desc = "move right" })
map("i", "<A-j>", "<Down>", { desc = "move down" })
map("i", "<A-k>", "<Up>", { desc = "move up" })

