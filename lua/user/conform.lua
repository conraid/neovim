local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Logica dinamica automatica per la shell (solo indentazione)
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

  -- Formattazione estetica automatica al salvataggio
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Personalizzazione dei formatter esistenti
conform.formatters.shfmt = {
  prepend_args = { "-i", "2", "-bn", "-s", "-ci", "-sr" },
}

conform.formatters.beautysh = {
  prepend_args = { "-i", "2" },
}

-- Nuovo formatter per l'incapsulamento sicuro (eseguito solo su richiesta)
conform.formatters.shellcheck_fix = {
  command = "bash",
  args = {
    "-c",
    [[
      set -euo pipefail
      TMPDIR=$(mktemp -d -t shellcheck_fix.XXXXXXXXXX)
      trap 'rm -rf "$TMPDIR"' EXIT

      TMPFILE="${TMPDIR}/script.sh"
      cat > "$TMPFILE"

      shellcheck --format=diff "$TMPFILE" | patch -s -f "$TMPFILE" >/dev/null 2>&1 || true

      cat "$TMPFILE"
    ]],
  },
  stdin = true,
}

-- Comando per l'incapsulamento esplicito delle variabili
vim.api.nvim_create_user_command("ShellFix", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local formatter_catena = {}

  -- Sceglie la catena corretta in base al tipo di file per riapplicare anche lo stile dopo il fix
  if bufname:match("%.SlackBuild$") then
    formatter_catena = { "shellcheck_fix", "beautysh" }
  else
    formatter_catena = { "shellcheck_fix", "shfmt" }
  end

  require("conform").format({
    formatters = formatter_catena,
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
  print("Incapsulamento variabili e formattazione completati!")
end, {})

-- Scorciatoia da tastiera comoda
vim.keymap.set("n", "<leader>sf", ":ShellFix<CR>", {
  desc = "Esegui shellcheck fix e formattazione esplicita",
  silent = true
})
