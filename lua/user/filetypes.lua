-- Riconosci i file .SlackBuild come shell script (bash)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.SlackBuild", "SlackBuild", "*.info" },
  command = "set filetype=sh",
})
