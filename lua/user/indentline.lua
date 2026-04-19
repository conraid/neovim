-- USA LE GRAFFE { } per gli eventi
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "ChangeLog", "ChangeLog.txt", "*.txt", "*.SlackBuild" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
