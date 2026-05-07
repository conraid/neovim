local lint = require("lint")

lint.linters_by_ft = {
  sh = {'shellcheck'},
  bash = {'shellcheck'},
  php = {'phpcs'},
}

-- Crea un autocomando per far girare il linter automaticamente
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})

vim.diagnostic.config({
  virtual_text = false, -- Mostra l'errore in grigio alla fine della riga, a me da fastidio :)
  signs = true,        -- Mostra le lettere con indicaione del problema, a sinistra
  underline = true,    -- Sottolinea la parte di codice sbagliata
  update_in_insert = false, -- Non disturba mentre scrivi
  severity_sort = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
      transparent = true,
      scope = 'cursor',
    }

    -- Questa riga cerca il messaggio e lo stampa in basso
    local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
    if #diagnostics > 0 then
      vim.api.nvim_echo({{diagnostics[1].message, "None"}}, false, {})
    end
  end,
})
