return {
    "jbyuki/venn.nvim",
    config = function()
        function _G.Toggle_venn()
            local venn_enabled = vim.inspect(vim.b.venn_enabled)
            if venn_enabled == "nil" then
                vim.b.venn_enabled = true
                vim.cmd [[setlocal ve=all]]
                vim.api.nvim_buf_set_keymap(
                    0,
                    "n",
                    "J",
                    "<C-v>j:VBox<CR>",
                    { noremap = true, desc = "Draw a line to the bottom" }
                )
                vim.api.nvim_buf_set_keymap(
                    0,
                    "n",
                    "K",
                    "<C-v>k:VBox<CR>",
                    { noremap = true, desc = "Draw a line to the top" }
                )
                vim.api.nvim_buf_set_keymap(
                    0,
                    "n",
                    "L",
                    "<C-v>l:VBox<CR>",
                    { noremap = true, desc = "Draw a line to the right" }
                )
                vim.api.nvim_buf_set_keymap(
                    0,
                    "n",
                    "H",
                    "<C-v>h:VBox<CR>",
                    { noremap = true, desc = "Draw a line to the left" }
                )
                vim.api.nvim_buf_set_keymap(
                    0,
                    "v",
                    "f",
                    ":VBox<CR>",
                    { noremap = true, desc = "Draw a box arround the selected area" }
                )
            else
                vim.cmd [[setlocal ve=]]
                vim.api.nvim_buf_del_keymap(0, "n", "J")
                vim.api.nvim_buf_del_keymap(0, "n", "K")
                vim.api.nvim_buf_del_keymap(0, "n", "L")
                vim.api.nvim_buf_del_keymap(0, "n", "H")
                vim.api.nvim_buf_del_keymap(0, "v", "f")
                vim.b.venn_enabled = nil
            end
        end

        vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true, desc = "Toggle venn" })
    end,
}
