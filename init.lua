-- ~/.config/nvim/init.lua

-- Forza Neovim a disabilitare Treesitter nativo per evitare il crash di sistema su Slackware
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    pcall(function()
      vim.treesitter.stop()
    end)
  end,
})

-- Disable terminal querying to avoid SSH latency warnings
vim.g.neovim_no_terminal_query = 1
-- Explicitly set the background to skip automatic terminal DSR queries
vim.o.background = "dark"

-- Prompt quando un file è già in fase di modifica, come nella vecchia modalità di nvim.
vim.cmd [[
  autocmd! nvim.swapfile
]]

-- Disabilito Tree-Sitter
require('user.antits')

-- 1. Plugin Manager (Lazy.nvim)
-- This must be first to register all plugins and commands
require('user.plugins')

-- 2. Theme and Visuals
-- Load your colors and highlights before anything else triggers a redraw
require('user.highlight')

-- 3. Plugin Configurations
-- Configure your tools while they are loaded but before buffers are initialized
--require('user.treesitter')
require('user.airline')
require('user.supertab')
require('user.nerdcommenter')
require('user.disabled_providers')
require("user.conform")
require("user.lint")
require('user.neogit')

-- 4. Core Neovim Settings
-- Load global options, keymaps, and commands
require('user.options')
require('user.keymaps')
require('user.commands')
require('user.filetypes')

-- 5. Specific Workflows and Autocommands
-- These often rely on everything above being already set up
require('user.autocmds')
require('user.changelog')
