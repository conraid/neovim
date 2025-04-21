-- ~/.config/nvim/init.lua

-- Prompt quando un file è già in fase di modifica
vim.cmd [[
  autocmd! nvim.swapfile
]]

-- Bootstrap packer se non è installato
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Moduli utente
require('user.options')
require('user.plugins').setup(packer_bootstrap)
require('user.autocmds')
require('user.keymaps')
require('user.highlight')
require('user.commands')

-- ALE, Airline, Supertab, NerdCommenter
require('user.ale')
require('user.airline')
require('user.supertab')
require('user.nerdcommenter')

