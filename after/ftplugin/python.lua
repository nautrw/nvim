vim.keymap.set('n', '<leader>dp', 'yiwoprint(<esc>pa)<esc>', { desc = 'Python print-debugging' })

vim.keymap.set(
  'n',
  '<leader>fi',
  function() require('conform').format { async = true, formatters = { 'ruff_organize_imports' } } end,
  { desc = 'Sort imports with Isort' }
)
