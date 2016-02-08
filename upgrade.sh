#!/bin/bash

set -eu

URL="https://github.com/tpope/vim-pathogen.git
https://github.com/powerline/powerline.git
https://github.com/scrooloose/syntastic.git
https://github.com/ervandew/supertab.git
https://github.com/tpope/vim-fugitive.git
https://github.com/scrooloose/nerdtree.git
https://github.com/bling/vim-airline.git
https://github.com/altercation/vim-colors-solarized.git
https://github.com/w0ng/vim-hybrid.git
https://github.com/othree/html5.vim.git
https://github.com/vim-airline/vim-airline-themes.git
https://github.com/StanAngeloff/php.vim.git"

for sub in $URL; do
  git submodule add --force "$sub" bundle/$(basename "$sub" | sed 's/\.git$//')
done
