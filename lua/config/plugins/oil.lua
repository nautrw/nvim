return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons", "refractalize/oil-git-status.nvim" },
    lazy = false,
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "type",
                "size",
                "mtime",
                "icon",
            },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                wrap = true,
                signcolumn = "yes:2",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 0,
                concealcursor = "nvic",
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = true,
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
                enabled = true,
                timeout_ms = 1000,
                autosave_changes = false,
            },
            constrain_cursor = "name",
            watch_for_changes = true,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = false,
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-r>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    local m = name:match("^%.")
                    return m ~= nil
                end,
                is_always_hidden = function(name, bufnr)
                    return false
                end,
                natural_order = "fast",
                case_insensitive = false,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
                highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                    return nil
                end,
            },
            extra_scp_args = {},
            git = {
                add = function(path)
                    return false
                end,
                mv = function(src_path, dest_path)
                    return false
                end,
                rm = function(path)
                    return false
                end,
            },
            float = {
                padding = 2,
                max_width = 0,
                max_height = 0,
                win_options = {
                    winblend = 0,
                },
                get_win_title = nil,
                preview_split = "right",
                override = function(conf)
                    return conf
                end,
            },
            preview_win = {
                update_on_cursor_moved = true,
                preview_method = "fast_scratch",
                disable_preview = function(filename)
                    return vim.fn.getfsize(filename) > 1024 * 1000
                end,
                win_options = {},
            },
            confirmation = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = 0.9,
                min_height = { 5, 0.1 },
                height = nil,
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                win_options = {
                    winblend = 0,
                },
            },
            ssh = {
            },
            keymaps_help = {
            },
        })

        require('oil-git-status').setup({
            show_ignored = true,
            symbols = {
                index = {
                    ["!"] = "", -- Ignored
                    ["?"] = "", -- Untracked
                    ["A"] = "", -- Added
                    ["C"] = "󰆏", -- Copied
                    ["D"] = "", -- Deleted
                    ["M"] = "󰏫", -- Modified
                    ["R"] = "󱅄", -- Renamed
                    ["T"] = "󱆟", -- Type Changed
                    ["U"] = "", -- Unmerged
                    [" "] = " ", -- Unmodified
                },
                working_tree = {
                    ["!"] = "",
                    ["?"] = "",
                    ["A"] = "",
                    ["C"] = "󰆏",
                    ["D"] = "",
                    ["M"] = "󰏫",
                    ["R"] = "󱅄",
                    ["T"] = "󱆟",
                    ["U"] = "",
                    [" "] = " ",
                },
            },
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "OilEnter",
            callback = vim.schedule_wrap(function(args)
                local oil = require("oil")
                if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
                    oil.open_preview()
                end
            end),
        })
    end
} 
