local M = {}

M.filtered_colorschemes = {}
M.ignore_table = {}
M.all_colorschemes = vim.fn.getcompletion("colorscheme ", "cmdline")

for _, colorscheme in ipairs(M.all_colorschemes) do
    if not vim.tbl_contains(M.ignore_table, colorscheme) then
        table.insert(M.filtered_colorschemes, colorscheme)
    end
end

function M.colorscheme_chooser()
    local items = {}
    
    for idx, colorscheme in ipairs(M.filtered_colorschemes) do
        local item = {
            idx = idx,
            name = colorscheme,
            text = colorscheme,
        }

        table.insert(items, item)
    end

    Snacks.picker({
        title = "Choose theme",
        layout = {
            preset = "vscode",
            preview = false,
        },
        items = items,
        format = function(item, _)
            return {
                { item.text, item.text_hl }
            }
        end,
        on_change = function(picker, item)
            vim.schedule(function()
                vim.cmd.colorscheme(item.text)
            end)
        end,
        confirm = function(picker, item)
            picker:close()

            if item then
                local file = io.open(vim.fn.stdpath "config" .. "/lua/config/persistent_colorscheme.lua", "w")
                file:write("vim.cmd.colorscheme('" .. item.text .. "')")
                file:close()
            end
        end,
    })
end

return M
