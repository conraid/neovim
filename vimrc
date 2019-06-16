if filereadable(glob("~/.vim/pluginrc.vim"))
	source ~/.vim/pluginrc.vim
endif

" Load pathogen paths
execute pathogen#infect()
call pathogen#helptags()

set mouse=a

let $LANG='it'
set langmenu=it

" color
set termguicolors
set guicursor=
set cursorline
if has('gui_running')
    set background=light
    hi CursorLine guibg=#eeeeee guifg=NONE
else
    set background=dark
"    colorscheme hybrid
"    "colorscheme desert
"    "let g:colors_name="desert"
    hi CursorLine gui=NONE guibg=#111111 guifg=NONE 
    hi CursorLineNr gui=NONE guibg=#111111 guifg=white
    hi Visual guibg=darkgray guifg=black
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
  
" Show space end of line  
hi ExtraWhitespace ctermbg=darkred guibg=darkred
":autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
"match ExtraWhitespace /\S\zs\s\+$/
"match ExtraWhitespace /\s\+$/
"match ExtraWhitespace /\s\+\%#\@<!$/

" Show number column
set number
set numberwidth=4
hi LineNr term=NONE cterm=NONE ctermfg=yellow

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

" Set php indent in accord to phpcs
autocmd FileType php setlocal noexpandtab

" set paste autoindent 
if has('nvim')
    set nopaste  
else
    set paste
endif
" set F2 toogle paste
set pastetoggle=<F2>

" map f3 to toogle search highlightning
nnoremap <F3> :set hlsearch!<CR>

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

" Set bash to .info file in SlackBuild directory. Thanks to dugan
autocmd BufEnter,BufNew *.info call CheckSlackBuildInfo()
function CheckSlackBuildInfo()
    if filereadable(expand('%:p:r'). '.SlackBuild')
        setlocal filetype=sh
    endif
endfunction

" default color variables
if !exists("g:color_line_bg_gui_default")
  let g:color_line_bg_gui_default = '#111111'
endif
if !exists("g:color_line_bg_gui_red")
  let g:color_line_bg_gui_red = '#431f1f'
endif
if !exists("g:color_line_bg_gui_green")
  let g:color_line_bg_gui_green = '#284134'
endif

" function to set color based on insert mode(s)
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    exe 'hi CursorLine guibg='.g:color_line_bg_gui_green
  elseif a:mode == 'r'
    exe 'hi CursorLine guibg='.g:color_line_bg_gui_red
  else
    exe 'hi CursorLine guibg='.g:color_line_bg_gui_default
  endif
endfunction

" function to set color back to default
function! DefaultStatusLineColor()
    exe 'hi CursorLine guibg='.g:color_line_bg_gui_default
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call DefaultStatusLineColor()
