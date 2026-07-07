if pcall(function() vim.cmd.colorscheme("lytmode") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `lytmode`")
end