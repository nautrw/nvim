Snacks = require 'snacks'

local M = {}

local commands = {
  {
    text = 'File picker (<leader>ff)',
    action = "lua Snacks.picker('files')",
  },
  {
    text = 'All pickers (<leader>fe)',
    action = 'lua Snacks.picker()',
  },
  {
    text = 'Undo history (<leader>fu)',
    action = "lua Snacks.picker('undo')",
  },
  {
    text = 'Find text (<leader>fg)',
    action = "lua Snacks.picker('grep')",
  },
  {
    text = 'Recent files (<leader>fr)',
    action = "lua Snacks.picker('recent')",
  },
  {
    text = 'Neovim config files (<leader>fc)',
    action = "lua Snacks.picker('files', { cwd = vim.fn.stdpath('config') })",
  },
  {
    text = 'File explorer (<leader>fp)',
    action = 'lua Snacks.explorer()',
  },
  {
    text = 'Buffer diagnostics (<leader>fd)',
    action = 'lua Snacks.picker.diagnostics_buffer()',
  },
  {
    text = 'Workspace diagnostics (<leader>fD)',
    action = 'lua Snacks.picker.diagnostics()',
  },
  {
    text = 'Clear search highlights (<Esc>)',
    action = 'nohl',
  },
  {
    text = 'Show diagnostics (<leader>df)',
    action = 'lua vim.diagnostic.open_float()',
  },
  {
    text = 'Diagnostic list (<leader>dq)',
    action = 'lua vim.diagnostic.setloclist()',
  },
  {
    text = 'Toggle inlay hints (<leader>dh)',
    action = 'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {0}, {0})',
  },
  {
    text = 'Open Oil (<leader>e)',
    action = 'Oil',
  },
  {
    text = 'Pick colorschemes (<leader>th)',
    action = "lua require('utils.colorscheme_picker').picker()",
  },
  {
    text = 'Command palette (<leader>p)',
    action = "lua require('utils.command_palette').picker()",
  },
  {
    text = 'Toggle Colorizer (<leader>tc)',
    action = 'ColorizerToggle',
  },
  {
    text = 'Restart Neovim (<leader>rr)',
    action = 'mksession! /tmp/Session.vim | restart source /tmp/Session.vim',
  },
  {
    text = 'Save file (<leader>vv)',
    action = 'w',
  },
  {
    text = 'Format buffer (<leader>fm)',
    action = "lua require('conform').format({ async = true, lsp_format = 'fallback' })",
  },
  {
    text = 'Open Lazygit (<leader>tg)',
    action = 'lua lazygit:toggle()',
  },
  {
    text = 'Toggle terminal (<leader>te)',
    action = 'ToggleTerm',
  },
  {
    text = 'Toggle terminal (<C-`>)',
    action = 'ToggleTerm',
  },
  {
    text = 'Go to declaration (gD)',
    action = 'vsplit | lua vim.lsp.buf.declaration()',
  },
  {
    text = 'Go to definition (gd)',
    action = 'vsplit | lua vim.lsp.buf.definition()',
  },
  {
    text = 'Stage hunk (<leader>hs)',
    action = 'Gitsigns stage_hunk',
  },
  {
    text = 'Stage buffer (<leader>hS)',
    action = 'Gitsigns stage_buffer',
  },
  {
    text = 'Reset hunk (<leader>hr)',
    action = 'Gitsigns reset_hunk',
  },
  {
    text = 'Reset buffer (<leader>hR)',
    action = 'Gitsigns reset_buffer',
  },
  {
    text = 'Diff buffer (<leader>hd)',
    action = 'Gitsigns diffthis',
  },
  {
    text = 'Open WhichKey (:WhichKey)',
    action = 'WhichKey',
  },
  {
    text = 'Open Mason (:Mason)',
    action = 'Mason',
  },
  {
    text = 'Open Lazy (:Lazy)',
    action = 'Lazy',
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
