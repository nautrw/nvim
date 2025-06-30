local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"
local previewers = require("telescope.previewers")

local filtered_colors = function()
    local ignore_table = {
        "default",
        "vim",
        "sorbet",
        "wildcharm",
        "zaibatsu",
        "desert",
        "evening",
        "industry",
        "koehler",
        "morning",
        "murphy",
        "pablo",
        "peachpuff",
        "ron",
        "shine",
        "slate",
        "torte",
        "zellner",
        "blue",
        "darkblue",
        "delek",
        "quiet",
        "elflord",
        "habamax",
        "lunaperche",
        "dayfox",
        "dawnfox",
        "unokai",
    }

    local allthemes = vim.fn.getcompletion('colorscheme ', 'cmdline')

    local filtered = {}
    for _, theme in ipairs(allthemes) do
        if not vim.tbl_contains(ignore_table, theme) then
            table.insert(filtered, theme)
        end
    end

    return filtered
end

return require('telescope').register_extension({
    exports = {colorscheme_chooser = function()
        local buffer = vim.api.nvim_get_current_buf()

        pickers.new({
            prompt_title = "Set Theme",
            finder = finders.new_table {
                results = filtered_colors(),
            },
            sorter = conf.generic_sorter(),
            previewer = previewers.new_buffer_previewer({
                define_preview = function(self, _)
                    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
                    vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
                    local ft = (vim.filetype.match({ buf = buffer }) or "diff"):match("%w+")
                    require("telescope.previewers.utils").highlighter(self.state.bufnr, ft)
                end,
            }),

            attach_mappings = function(buffer)
                vim.schedule(function()
                    vim.api.nvim_create_autocmd("TextChangedI", {
                        buffer = buffer,
                        callback = function()
                            if action_state.get_selected_entry() then
                                vim.cmd("colorscheme " .. action_state.get_selected_entry()[1])
                            end
                        end,
                    })
                end)

                actions.move_selection_previous:replace(function()
                    action_set.shift_selection(buffer, -1)
                    vim.cmd("colorscheme " .. action_state.get_selected_entry()[1])
                end)
                actions.move_selection_next:replace(function()
                    action_set.shift_selection(buffer, 1)
                    vim.cmd("colorscheme " .. action_state.get_selected_entry()[1])
                end)

                actions.select_default:replace(function()
                    if action_state.get_selected_entry() then
                        vim.cmd("colorscheme " .. action_state.get_selected_entry()[1])
                        local file = io.open(vim.fn.stdpath('config') .. "/lua/config/persistent_colorscheme.lua", "w")
                        file:write("vim.cmd 'colorscheme " .. action_state.get_selected_entry()[1] .. "'")
                        file:close()
                        actions.close(buffer)
                    end
                end)
                return true
            end,
        }):find()
    end
}})
