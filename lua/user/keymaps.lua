-- ~/.config/nvim/lua/user/keymaps.lua

-- Toggle spellcheck
vim.api.nvim_set_keymap('n', '<F4>', ':setlocal spell! spelllang=it<CR>', { noremap = true, silent = true })

-- Selezione visuale e macro
vim.api.nvim_set_keymap('v', '<F3>', '@:', {})

-- Taglist toggle
vim.api.nvim_set_keymap('n', '<F8>', ':TlistToggle<CR>', { noremap = true, silent = true })

-- Clipboard (X11 selezione primaria)
vim.api.nvim_set_keymap('v', '<LeftRelease>', '"*ygv', { noremap = true, silent = true })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Torna a inizio riga con FN+<- sulla tastiera mac
vim.keymap.set('n', '<C-a>', '^', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', '<C-o>^', { noremap = true, silent = true })

-- Fine riga (Fn + → sulla tastiera del mac)
vim.keymap.set('n', '<C-e>', '$')
vim.keymap.set('i', '<C-e>', '<C-o>$')
