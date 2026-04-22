-- ~/.config/nvim/lua/user/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Toggle spellcheck (su Mac fn+F4)
keymap('n', '<F4>', ':setlocal spell! spelllang=it<CR>', opts)

-- Selezione visuale e macro
keymap('v', '<F3>', '@:', {})

-- Taglist toggle
keymap('n', '<F8>', ':TlistToggle<CR>', opts)

-- CLIPBOARD: Gestione differenziata
if vim.fn.has('mac') == 1 then
    -- Su Mac usiamo unnamedplus per sincronizzare tutto col Command+V
    vim.opt.clipboard = "unnamedplus"
else
    -- Su Linux (X11) mantiengo la selezione al rilascio del mouse
    keymap('v', '<LeftRelease>', '"*ygv', opts)
end

-- PROTEZIONE: d e x non copiano nulla (registro nero)
keymap("n", "x", '"_x')
keymap("n", "d", '"_d')
keymap("v", "d", '"_d')

-- NAVIGAZIONE: Torna a inizio riga
keymap('n', '<C-a>', '^', opts)
keymap('i', '<C-a>', '<C-o>^', opts)

-- Fine riga
keymap('n', '<C-e>', '$', opts)
keymap('i', '<C-e>', '<C-o>$', opts)
