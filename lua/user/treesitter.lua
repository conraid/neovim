-- ~/.config/nvim/lua/user/treesitter.lua

local is_root = os.getenv("USER") == "root"

local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

configs.setup({
  -- Lista dei parser da mantenere sempre installati
  -- Se è root, non forzare l'installazione di nulla (lista vuota)
  ensure_installed = is_root and {} or {
    "awk",
    "c",
    "cairo",
    "cmake",
    "cpp",
    "diff",
    "editorconfig",
    "git_config",
    "gitcommit",
    "gitignore",
    "go",
    "html",
    "http",
    "ini",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "make",
    "markdown",
    "markdown_inline",
    "meson",
    "muttrc",
    "nginx",
    "perl",
    "php",
    "phpdoc",
    "printf",
    "python",
    "query",
    "regex",
    "requirements",
    "robots",
    "sql",
    "ssh_config",
    "toml",
    "tsx",
    "typescript",
    "udev",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },

  ignore_install = {
    "bash",
  },

  -- Installazione sincrona (solo per i parser in ensure_installed)
  sync_install = false,

  -- Installazione automatica se apri un file non in lista
  -- auto_install = true,
  auto_install = not is_root,

highlight = {
    -- Disabilita completamente il motore di colorazione di Treesitter
    enable = false,

    -- Riabilita il vecchio motore syntax di Vim per TUTTI i file
    -- (Fondamentale, altrimenti vedresti tutto grigio/bianco)
    additional_vim_regex_highlighting = true,
  },

  -- Abilita l'indentazione intelligente basata su Treesitter
  indent = {
    enable = true,
  },
})
