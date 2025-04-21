-- ~/.config/nvim/lua/user/treesitter.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "php", "bash", "html", "css", "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

