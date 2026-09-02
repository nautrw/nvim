if pcall(function() vim.cmd.colorscheme 'paradise' end) then
  return
else
  vim.cmd.colorscheme 'paradise'
  print 'Failed to load colorscheme `paradise`'
end
