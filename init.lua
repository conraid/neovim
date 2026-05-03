-- ~/.config/nvim/init.lua

-- Prompt quando un file è già in fase di modifica, come nella vecchia modalità di nvim.
vim.cmd [[
  autocmd! nvim.swapfile
]]

-- 1. Plugin Manager (Lazy.nvim)
-- This must be first to register all plugins and commands
require('user.plugins')

-- 2. Theme and Visuals
-- Load your colors and highlights before anything else triggers a redraw
require('user.highlight')

-- 3. Plugin Configurations
-- Configure your tools while they are loaded but before buffers are initialized
require('user.treesitter')
require('user.ale')
require('user.airline')
require('user.supertab')
require('user.nerdcommenter')
require('user.disabled_providers')

-- 4. Core Neovim Settings
-- Load global options, keymaps, and commands
require('user.options')
require('user.keymaps')
require('user.commands')

-- 5. Specific Workflows and Autocommands
-- These often rely on everything above being already set up
require('user.autocmds')
require('user.changelog')

