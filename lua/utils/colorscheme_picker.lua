Snacks = require 'snacks'

local M = {}

function M.get_filtered_colorschemes()
  local unfiltered_list = vim.fn.getcompletion('', 'color')
  local filter = {
    'darcula-solid',
    'dracula',
    'monokai-pro-light',
    'noctis_hibernus',
    'noctis_lux',
    'noctis_lilac',
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
    'minischeme',
    'miniautumn',
    'minicyan',
    'kintsugi-light',
    'minisummer',
    'minispring',
    'miniwinter',
    'github_dark_colorblind',
    'github_dark_high_contrast',
    'github_dark_default',
    'github_dark_tritanopia',
    'github_dark',
    'github_light_colorblind',
    'github_light_high_contrast',
    'github_light_default',
    'github_light_tritanopia',
    'github_light',
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
      preset = 'right',
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
    on_change = function(_, item)
      vim.schedule(function() vim.cmd.colorscheme(item.text) end)
    end,
  }
end

return M
