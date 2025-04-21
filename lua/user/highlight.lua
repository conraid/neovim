-- ~/.config/nvim/lua/user/highlight.lua

if vim.opt.termguicolors:get() then
  vim.cmd [[hi CursorLine guibg=#111111 guifg=NONE]]
  vim.cmd [[hi CursorLineNr gui=NONE guibg=#111111 guifg=white]]
  vim.cmd [[hi Visual guibg=darkgray guifg=black]]
else
  vim.cmd [[hi CursorLine guibg=grey guifg=NONE]]
end

if vim.fn.has('gui_running') == 1 then
  vim.opt.background = 'light'
else
  vim.opt.background = 'dark'
  vim.cmd [[colorscheme vim]]
end

