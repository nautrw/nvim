if pcall(function() vim.cmd.colorscheme("256-noir") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `256-noir`")
end