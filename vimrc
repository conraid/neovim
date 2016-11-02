if filereadable(glob("~/.vim/pluginrc.vim"))
	source ~/.vim/pluginrc.vim
endif

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
set omnifunc=syntaxcomplete#Complete

" set paste autoindent 
if has('nvim')
    set nopaste  
else
    set paste
endif
" set F2 toogle paste
set pastetoggle=<F2>

" set terminal 256 color. For blu and bold font
"set t_Co=256

" map f3 to toogle search highlightning
nnoremap <F3> :set hlsearch!<CR>

" Remove annoying underline in listing
set nocursorline

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" MUTT
au BufRead /tmp/mutt-* set tw=72

" Set <F4> to SPELL check
map <F4> :setlocal spell! spelllang=it<CR>
highlight SpellBad ctermbg=darkred ctermfg=white term=underline cterm=underline

if has("autocmd")
    autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
endif

" Set cursorline (leave last)
highlight CursorLine cterm=NONE ctermbg=233
highlight CursorLineNR ctermbg=233 ctermfg=255 
set cursorline

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
