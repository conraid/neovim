-- ~/.config/nvim/lua/user/options.lua

-- Impostazioni di base
vim.opt.mouse = 'a'
vim.env.LANG = 'it'
vim.opt.encoding = 'utf-8'
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list:longest', 'full' }

-- Swap, backup, undo
vim.opt.swapfile = true
vim.opt.undofile = true

if vim.fn.has('mac') == 1 then
  -- Percorsi per Mac
  local data_dir = vim.fn.stdpath('state')
  vim.opt.backupdir = data_dir .. '/backup//'
  vim.opt.directory = data_dir .. '/swp//'
  vim.opt.undodir   = data_dir .. '/undo//'
else
  -- Percorsi per Linux
  local linux_tmp = '/home/tmp/' .. vim.env.USER
  vim.opt.backupdir = linux_tmp .. '/backup//'
  vim.opt.directory = linux_tmp .. '/swp//'
  vim.opt.undodir   = linux_tmp .. '/undo//'
end

-- Crea le directory se non esistono
for _, dir in pairs({vim.opt.backupdir, vim.opt.directory, vim.opt.undodir}) do
    local path = dir:get()[1]:gsub("//$", "")
    if vim.fn.isdirectory(path) == 0 then
        vim.fn.mkdir(path, 'p')
    end
end

-- Indentazione e sintassi
vim.opt.autoindent = true
vim.cmd('syntax enable')
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.laststatus = 2
vim.opt.statusline = vim.opt.statusline:get() .. '%F'
vim.opt.autoread = true
vim.opt.compatible = false
vim.opt.ruler = true
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.cmd('filetype plugin indent on')
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.paste = false
vim.opt.inccommand = 'nosplit'
vim.opt.updatetime = 100

-- Visual
vim.opt.termguicolors = true
vim.opt.guicursor = ''
vim.opt.cursorline = true

-- Copy in system clipboard
-- vim.opt.clipboard:append("unnamedplus")
-- vim.g.clipboard = false

vim.opt.backupcopy = "yes"

-- Configurazione Folding "Tutto Aperto"
vim.opt.foldmethod = "expr"                     -- Usa Treesitter per il calcolo dei blocchi
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Il motore logico
vim.opt.foldlevel = 99                          -- Apre tutti i livelli di default
vim.opt.foldenable = true                       -- Abilita la possibilità di foldare
vim.opt.foldcolumn = "1"

-- Disabilitare il check DSR
vim.g.neovim_check_dsr = 0

vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

