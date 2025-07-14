vim.api.nvim_create_user_command("Scratch", function()
  vim.cmd("new")
  vim.opt_local.buftype = "nofile"
  vim.opt_local.bufhidden = "wipe"
  vim.opt_local.backup = false
  vim.opt_local.swapfile = false
  vim.opt_local.number = true
end, {})
