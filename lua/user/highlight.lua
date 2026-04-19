-- ~/.config/nvim/lua/user/highlight.lua

-- Enable 24-bit RGB color support
vim.opt.termguicolors = true

-- Theme and Background configuration
if vim.fn.has('gui_running') == 1 then
  vim.opt.background = 'light'
else
  vim.opt.background = 'dark'
  -- Load the colorscheme before custom highlights to prevent overwriting
  vim.cmd [[colorscheme vim]]
end

-- Custom highlights for cursor line and visual selection
vim.cmd [[hi CursorLine guibg=#071e21 guifg=NONE]]
vim.cmd [[hi CursorLineNr gui=NONE guibg=#111111 guifg=white]]
vim.cmd [[hi Visual guibg=#444444 guifg=NONE]]
