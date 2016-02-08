" Load pathogen paths
execute pathogen#infect()
call pathogen#helptags()

let $LANG='it' 
set langmenu=it

" color
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=dark
"    colorscheme hybrid
"    "colorscheme desert
"    "let g:colors_name="desert"
endif

" preserve paste
set paste

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Backup and temp files
"set nobackup
"set nowb
"set noswapfile
"set noundofile
set backupdir=/home/tmp/$USER
set directory=/home/tmp/$USER
set undodir=/home/tmp/$USER

" Font and color
"set background=dark

" Syntax
set autoindent
syntax enable
set syntax=on

" Show number column
set number
set numberwidth=4
highlight LineNr term=none cterm=none ctermfg=7

" Show statusbar
set laststatus=2
" Show full path of file
set statusline+=%F

" Set to auto read when a file is changed from the outside
set autoread

" Set nocompatible 
set nocp 
 
 "Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Set filetype indent 
filetype plugin indent on

" set paste autoindent
set paste

" set terminal 256 color. For blu and bold font
"set t_Co=256

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
