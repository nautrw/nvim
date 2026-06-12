if pcall(function() vim.cmd.colorscheme("nordic") end) then
  return
else
  vim.cmd.colorscheme("paradise")
  print("Failed to load colorscheme `nordic`")
end