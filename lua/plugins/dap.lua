return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    -- event = 'VeryLazy',
    keys = {
      { '<leader>dt', function() require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
      { '<leader>dc', function() require('dap').continue() end, desc = '(Dap) Continue' },
      { '<leader>di', function() require('dap').step_into() end, desc = '(Dap) Step into' },
      { '<leader>do', function() require('dap').step_over() end, desc = '(Dap) Step over' },
      { '<leader>du', function() require('dap').step_out() end, desc = '(Dap) Step out' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'Open dap REPL' },
      { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
      {
        '<leader>dq',
        function()
          require('dap').terminate()
          require('dapui').close()
          require('nvim-dap-virtual-text').toggle()
        end,
        desc = 'Terminate Dap',
      },
      {
        '<leader>db',
        function() require('dap').list_breakpoints() end,
        desc = 'List dap breakpoints',
      },
    },
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('nvim-dap-virtual-text').setup()

      dap.configurations = {
        python = {
          {
            type = 'python',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            pythonPath = function() return '/usr/bin/python' end,
          },
        },
      }
      -- Dap UI
      dapui.setup()

      vim.fn.sign_define('DapBreakpoint', { text = '' })

      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = {
      handlers = {
        python = function(_)
          local dap = require 'dap'

          dap.adapters.python = {
            type = 'executable',
            command = 'debugpy-adapter',
          }
        end,
      },
    },
  },
}
