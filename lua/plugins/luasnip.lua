return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local ls = require 'luasnip'

    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      if ls.locally_jumpable(1) then
        ls.jump(1)
      else
        return '<Tab>'
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
      if ls.locally_jumpable(-1) then
        ls.jump(-1)
      else
        return '<S-Tab>'
      end
    end, { silent = true, expr = true })
  end,
}
