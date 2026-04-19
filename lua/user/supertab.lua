-- ~/.config/nvim/lua/user/supertab.lua

vim.g.SuperTabMappingForward = '<c-n>'
vim.g.SuperTabMappingBackward = '<c-n>'

-- Forza Supertab a non inserire tab reali
vim.g.SuperTabDefaultCompletionType = "<c-p>"
vim.g.SuperTabMappingForward = '<Tab>'
vim.g.SuperTabMappingBackward = '<S-Tab>'

-- Opzione Cruciale: se expandtab è attivo, Supertab deve inserire SPAZI
vim.api.nvim_set_var('SuperTabDefaultCompletionType', 'context')
