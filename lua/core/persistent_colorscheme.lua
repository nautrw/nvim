if pcall(function() vim.cmd.colorscheme("ember-soft") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `ember-soft`")
end