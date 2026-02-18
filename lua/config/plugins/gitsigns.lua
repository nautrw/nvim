return {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
        -- load gitsigns only when a git file is opened
        vim.api.nvim_create_autocmd({ "BufRead" }, {
            group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
            callback = function()
                vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
                    on_exit = function(_, return_code)
                        if return_code == 0 then
                            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                            vim.schedule(function()
                                require("lazy").load { plugins = { "gitsigns.nvim" } }
                            end)
                        end
                    end,
                })
            end,
        })
    end,
    config = function()
        require("gitsigns").setup {
            signs = {
                add = { text = "│" },
                change = { text = "┆ " },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┊" },
            },
            signs_staged = {
                add = { text = "┃" },
                change = { text = "┇" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┋" },
            },
            signs_staged_enable = true,
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
                follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = true,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 0,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        }
    end,
}
