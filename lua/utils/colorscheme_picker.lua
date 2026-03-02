Snacks = require 'snacks'

local M = {}

function M.get_filtered_colorschemes()
  local unfiltered_list = vim.fn.getcompletion('', 'color')
  local filter = {
    'desert',
    'evening',
    'industry',
    'koehler',
    'morning',
    'murphy',
    'pablo',
    'peachpuff',
    'ron',
    'shine',
    'slate',
    'torte',
    'zellner',
    'blue',
    'darkblue',
    'delek',
    'quiet',
    'elflord',
    'habamax',
    'lunaperche',
    'zaibatsu',
    'wildcharm',
    'sorbet',
    'vim',
    'retrobox',
    'unokai',
    'default',
    'catppuccin',
    'koda-dark',
    'koda-glade',
    'koda-light',
    'koda-moss',
  }

  local filtered_list = {}

  for _, colorscheme in pairs(unfiltered_list) do
    if not vim.tbl_contains(filter, colorscheme) then table.insert(filtered_list, colorscheme) end
  end

  return filtered_list
end

function M.picker()
  local items = {}
  local colorschemes = M.get_filtered_colorschemes()

  for idx, colorscheme in ipairs(colorschemes) do
    local item = {
      idx = idx,
      text = colorscheme,
    }
    table.insert(items, item)
  end

  Snacks.picker {
    title = 'Colorscheme picker',
    layout = {
      preset = 'vscode',
      preview = false,
    },
    items = items,
    format = function(item, _)
      return {
        { item.text, item.text_hl },
      }
    end,
    confirm = function(picker, item)
      vim.schedule(function() vim.cmd.colorscheme(item.text) end)

      local file = io.open(vim.fn.stdpath 'config' .. '/lua/core/persistent_colorscheme.lua', 'w')
      file:write('vim.cmd.colorscheme("' .. item.text .. '")')
      file:close()

      picker:close()
    end,
    on_change = function(picker, item)
      vim.schedule(function() vim.cmd.colorscheme(item.text) end)
    end,
  }
end

return M
