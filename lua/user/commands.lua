-- ~/.config/nvim/lua/user/commands.lua

vim.api.nvim_create_user_command('PHP', function()
  vim.g.ale_php_phpcbf_standard = "PSR12"
  vim.g.ale_php_phpcs_standard = "PSR12"
  vim.cmd('ALELint')
end, {})

vim.api.nvim_create_user_command('WP', function()
  vim.g.ale_php_phpcbf_standard = "WordPress"
  vim.g.ale_php_phpcs_standard = "WordPress"
  vim.cmd('ALELint')
end, {})

vim.api.nvim_create_user_command('FormatPHP', function()
  vim.g.ale_php_phpcbf_standard = "PSR12"
  vim.cmd('ALEFix')
end, {})

vim.api.nvim_create_user_command('FormatWP', function()
  vim.g.ale_php_phpcbf_standard = "WordPress"
  vim.cmd('ALEFix')
end, {})

vim.api.nvim_create_user_command('Format', function()
  vim.cmd('ALEFix')
end, {})

