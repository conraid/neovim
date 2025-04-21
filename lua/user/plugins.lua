-- ~/.config/nvim/lua/user/plugins.lua

local M = {}

function M.setup(packer_bootstrap)
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'dense-analysis/ale'
    use 'github/copilot.vim'
    use 'Yggdroot/indentLine'
    use 'preservim/nerdcommenter'
    use 'nvim-treesitter/nvim-treesitter'
    use 'ervandew/supertab'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'ntpeters/vim-better-whitespace'
    use 'chrisbra/Colorizer'
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-surround'

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
end

return M

