" Set NerdTree
" Visualizzo NERDTree con i tasti 'CTRL-N'
map <C-n> :NERDTreeToggle<CR>
" Ignoro i file di backup di Vim
let NERDTreeIgnore=['\.swp$']
" Utilizzo <leader>p per mostrare e nascondere NERDTree
silent! nmap <silent> <Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeWinSize=35
"map <leader>nn :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark
"map <leader>nf :NERDTreeFind<cr>

" Set Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'luna'

" Set Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map={'mode':'passive', 'active_filetypes':[], 'passive_filetypes':['']}
let g:syntastic_phpcs_disable=0
let g:syntastic_php_phpcs_args='--standard=WordPress'
let g:syntastic_html_tidy_exec = 'tidy5'
noremap <F5> :SyntasticCheck<CR>
noremap <F6> :SyntasticReset<CR>

" Set phpqa
" Pass arguments to phpcs binary
let g:phpqa_codesniffer_args = "--standard=Wordpress"
" PHP codesniffer binary (default = phpcs)
let g:phpqa_codesniffer_cmd='/usr/bin/phpcs'
" Run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 1
" Ruleset phpmd
let g:phpqa_messdetector_ruleset = "cleancode,codesize,naming,design,unusedcode"
" Stop the location list opening automatically
let g:phpqa_open_loc = 0

" Set EMMET
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<C-x>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/conf/emmet/snippets.json')), "\n"))

" Supertab
let g:SuperTabMappingForward = "<c-n>"
let g:SuperTabMappingBackward = "<c-n>"
"let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"

" NerdCommenter
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'php': { 'left': '/** ','right': ' */' } }

" Set F3 repeat in visual mode
vmap <F3> @:

" Set F8 Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" NNN
let g:nnn#layout = 'vnew' " or vnew, tabnew etc.
" Or pass a dictionary with window size


