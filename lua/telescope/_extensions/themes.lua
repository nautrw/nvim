local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"

local function switcher()
    local buffer = vim.api.nvim_get_current_buf()
    local picker = pickers.new {
        prompt_title = "Set Theme",
        finder = finders.new_table {
            results = vim.fn.getcompletion("colorscheme ", "cmdline"),
        },
        sorter = conf.generic_sorter(),

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
                    file = io.open("lua/config/persistent_colorscheme.lua", "w")
                    file:write("vim.cmd 'colorscheme " .. action_state.get_selected_entry()[1] .. "'")
                    file:close()
                    actions.close(buffer)
                end
            end)
            return true
        end,
    }

    picker:find()
end

return require("telescope").register_extension {
    exports = { themes = switcher },
}
