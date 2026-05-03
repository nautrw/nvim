Snacks = require 'snacks'

local M = {}

function M.get_filtered_colorschemes()
  local unfiltered_list = vim.fn.getcompletion('', 'color')

  -- if lazy is available, extend the colors list with unloaded colorschemes
  local lazy = package.loaded['lazy.core.util']
  if lazy and lazy.get_unloaded_rtp then
    local paths = lazy.get_unloaded_rtp ''
    local all_files = vim.fn.globpath(table.concat(paths, ','), 'colors/*', true, true)
    for _, f in ipairs(all_files) do
      local color = vim.fn.fnamemodify(f, ':t:r')
      if not vim.tbl_contains(unfiltered_list, color) then table.insert(unfiltered_list, color) end
    end
  end

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
    'themes',
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
      vim.schedule(function()
        local _, _ = pcall(function() vim.cmd.colorscheme(item.text) end)
      end)

      local file = io.open(vim.fn.stdpath 'config' .. '/lua/core/persistent_colorscheme.lua', 'w')
      -- this will catch any errors
      file:write([[if pcall(function() vim.cmd.colorscheme("]] .. item.text .. [[") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `]] .. item.text .. [[`")
end]])
      file:close()

      picker:close()
    end,
    on_change = function(_, item)
      vim.schedule(function()
        local _, _ = pcall(function() vim.cmd.colorscheme(item.text) end)
      end)
    end,
  }
end

return M
