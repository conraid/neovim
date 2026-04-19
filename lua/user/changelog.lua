-- Autocomando specifico per i file ChangeLog
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "ChangeLog.txt", "ChangeLog", "PKGNOTE", "README" },
  callback = function()
    -- Imposta il limite di testo a 72 (va a capo da solo mentre scrivi)
    -- vim.opt_local.textwidth = 72
    -- Mostra una riga verticale di riferimento alla colonna 73
    vim.opt_local.colorcolumn = "73"
    -- Abilita il wrapping visivo nel caso aprissi file con righe lunghissime
    -- vim.opt_local.wrap = true
  end,
})

vim.cmd("highlight ColorColumn guibg=#0c2f33")


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- Qui specifichiamo il nome esatto del file invece del tipo
  pattern = { "ChangeLog.txt", "ChangeLog", "PKGNOTE", "README" },
  callback = function()
    vim.schedule(function()
      vim.opt_local.expandtab = true
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      -- Blocca Supertab solo in questo file
      vim.b.supertab_no_tab_mapping = 1
    end)
  end,
})
