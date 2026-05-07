local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Logica dinamica per la shell
    sh = function(bufnr)
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("%.SlackBuild$") then
        return { "beautysh" }
      end
      return { "shfmt" }
    end,
    -- Altri linguaggi
    php = { "phpcbf" },
  },

  -- Formattazione automatica al salvataggio
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Personalizzazione dei formatter (senza sudo, come da tua abitudine)
conform.formatters.shfmt = {
  prepend_args = { "-i", "2", "-bn", "-s", "-ci", "-sr" },
}

conform.formatters.beautysh = {
  prepend_args = { "-i", "2" },
}
