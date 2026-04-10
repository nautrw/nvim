Snacks = require 'snacks'

local M = {}

local commands = {
  {
    text = 'Pick colorschemes (<leader>th)',
    action = "lua require('utils.colorscheme_picker').picker()",
  },
  {
    text = 'Restart Neovim (<leader>rr)',
    action = 'mksession! /tmp/Session.vim | restart source /tmp/Session.vim',
  },
  {
    text = 'Toggle Colorizer (<leader>ct)',
    action = 'ColorizerToggle',
  },
  {
    text = 'Toggle inlay hints (<leader>dh)',
    action = 'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {0}, {0})',
  },
}

function M.picker()
  local items = {}

  for idx, command in ipairs(commands) do
    local item = {
      idx = idx,
      text = command.text,
      action = command.action,
    }
    table.insert(items, item)
  end

  Snacks.picker {
    title = 'Command palette',
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
      vim.schedule(function()
        print('Running `:' .. item.action .. '`')
        vim.cmd(item.action)
      end)
      picker:close()
    end,
  }
end

return M
