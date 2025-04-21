-- ~/.config/nvim/lua/user/keymaps.lua

-- Toggle spellcheck
vim.api.nvim_set_keymap('n', '<F4>', ':setlocal spell! spelllang=it<CR>', { noremap = true, silent = true })

-- Selezione visuale e macro
vim.api.nvim_set_keymap('v', '<F3>', '@:', {})

-- Taglist toggle
vim.api.nvim_set_keymap('n', '<F8>', ':TlistToggle<CR>', { noremap = true, silent = true })

-- Clipboard (X11 selezione primaria)
vim.api.nvim_set_keymap('v', '<LeftRelease>', '"*ygv', { noremap = true, silent = true })

