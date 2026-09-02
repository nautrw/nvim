if pcall(function() vim.cmd.colorscheme("ember-lighter") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `ember-lighter`")
end