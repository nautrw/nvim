vim.keymap.set('n', '<leader>dp', 'yiwoprint(<esc>pa)<esc>', { desc = 'Python print-debugging' })

vim.keymap.set('n', '<leader>fi', function() require('conform').format { async = true, formatters = {"isort",}, } end, { desc = 'Sort imports with Isort' })
