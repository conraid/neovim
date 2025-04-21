-- ~/.config/nvim/lua/user/ale.lua

vim.g.ale_virtualtext_cursor = 0
vim.g.ale_set_highlights = 0
vim.g.ale_php_phpcbf_standard = 'WordPress'
vim.g.ale_php_phpcs_standard = 'WordPress'
vim.g.ale_fixers = {
  php = {'phpcbf'},
  sh = {'shfmt'},
}

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.fn.getline(1):match('^#!.*bash') then
      vim.b.ale_fixers = { 'shfmt' }
    end
  end,
})

