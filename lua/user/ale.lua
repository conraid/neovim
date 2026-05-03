-- ~/.config/nvim/lua/user/ale.lua

-- Impostazioni estetiche e standard
vim.g.ale_virtualtext_cursor = 0
vim.g.ale_set_highlights = 0
vim.g.ale_php_phpcbf_standard = 'WordPress'
vim.g.ale_php_phpcs_standard = 'WordPress'

vim.g.ale_linters = {
    sh = {'shellcheck'},
    bash = {'shellcheck'},
    php = {'phpcs'},
}

vim.g.ale_fixers = {
    php = {'phpcbf'},
    sh = {'shfmt'},
    bash = {'shfmt'},
}

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        local first_line = vim.fn.getline(1)
        if first_line:match('^#!.*bash') or first_line:match('^#!.*sh') then
            -- Usiamo vim.b (buffer-local) per essere sicuri che si applichi solo qui
            vim.b.ale_fixers = { 'shfmt' }
            vim.b.ale_linters = { 'shellcheck' }
        end
    end,
})

-- Opzionale: Per far sì che ALE ripari il file automaticamente al salvataggio
vim.g.ale_fix_on_save = 1

-- Configurazione per shfmt
vim.g.ale_sh_shfmt_options = "-i 2 -bn -s -ci -sr -kp"
