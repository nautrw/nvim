return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>ff', function() Snacks.picker 'files' end, desc = 'File picker' },
    { '<leader>fe', function() Snacks.picker() end, desc = 'Every snacks picker' },
    { '<leader>fu', function() Snacks.picker 'undo' end, desc = 'Undo history picker' },
    { '<leader>fg', function() Snacks.picker 'grep' end, desc = 'Find text' },
    { '<leader>fr', function() Snacks.picker 'recent' end, desc = 'Pick recent files' },
    {
      '<leader>fc',
      function() Snacks.picker('files', { cwd = vim.fn.stdpath 'config' }) end,
      desc = 'Pick files in Neovim Configuration',
    },
  },
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = 'Plus Ultra',
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File in working directory', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = '󰏇 ', key = 'e', desc = 'Open Oil', action = ':Oil' },
          {
            icon = ' ',
            key = 'g',
            desc = 'Find Text',
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = ' ',
            key = 'r',
            desc = 'Recent Files',
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = ' ',
            key = 't',
            desc = 'Choose Theme',
            action = ":lua require('utils.colorscheme_picker').picker()",
          },
          {
            icon = '󰒲 ',
            key = 'L',
            desc = 'Lazy.nvim',
            action = ':Lazy',
          },
          {
            icon = "",
            key = "m",
            desc = "Mason",
            action = ":Mason",
          },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Quick Actions', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    picker = {
      enable = true,
      prompt = ' 󰘧 ',
    },
    indent = {
      enable = true,
    },
    quickfile = {
      enable = true,
    },
    bigfile = {
      enable = true,
      notify = true,
      size = 1 * 1024 * 1024,
      setup = function(ctx)
        if vim.fn.exists ':NoMatchParen' ~= 0 then vim.cmd [[NoMatchParen]] end
        Snacks.util.wo(0, { foldmethod = 'manual', statuscolumn = '', conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ctx.buf) then vim.bo[ctx.buf].syntax = ctx.ft end
        end)
      end,
    },
    image = {
      enable = true,
    },
  },
}
