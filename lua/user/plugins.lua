-- ~/.config/nvim/lua/user/plugins.lua

-- 0. Check if we are running as root
local is_root = os.getenv("USER") == "root"

-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Initialize lazy.nvim
require("lazy").setup({
  -- Development Tools
  "dense-analysis/ale",
  { "github/copilot.vim", enabled = false },
  "Yggdroot/indentLine",
  "preservim/nerdcommenter",

  -- Treesitter: Se root, non facciamo TSUpdate automatico per evitare ricompilazioni
  {
    "nvim-treesitter/nvim-treesitter",
    build = is_root and nil or ":TSUpdate"
  },

  "ervandew/supertab",

  -- UI / Appearance
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "ntpeters/vim-better-whitespace",
  "chrisbra/Colorizer",

  -- Editor Support
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",

  -- Codeium: Disabilitato se l'utente è root
  {
    "Exafunction/codeium.vim",
    enabled = not is_root
  },

}, {
  ui = {
    border = "rounded",
  },
})
