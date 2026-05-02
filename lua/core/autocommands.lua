-- Show a flash when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      -- defer centering slightly so it's applied after render
      vim.schedule(function() vim.cmd 'normal! zz' end)
    end
  end,
})

-- Open help vertically
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd L',
})

-- Syntax highlighting for .env files
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('dotenv_ft', { clear = true }),
  pattern = { '.env', '.env.*' },
  callback = function() vim.bo.filetype = 'dosini' end,
})

-- Highlight when static cursor
vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('LspReferenceHighlight', { clear = true }),
  desc = 'Highlight references under cursor',
  callback = function()
    -- Only run if the cursor is not in insert mode
    if vim.fn.mode() ~= 'i' then
      local clients = vim.lsp.get_clients { bufnr = 0 }
      local supports_highlight = false
      for _, client in ipairs(clients) do
        if client.server_capabilities.documentHighlightProvider then
          supports_highlight = true
          break -- Found a supporting client, no need to check others
        end
      end

      -- Proceed only if an LSP is active AND supports the feature
      if supports_highlight then
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
      end
    end
  end,
})

-- Clear highlights on insert enter
vim.api.nvim_create_autocmd('CursorMovedI', {
  group = 'LspReferenceHighlight',
  desc = 'Clear highlights when entering insert mode',
  callback = function() vim.lsp.buf.clear_references() end,
})
