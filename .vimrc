execute pathogen#infect()

colorscheme busierbee

"let g:indentLine_enabled = 1
"let g:indentLine_color_term = 131

" Nerd Tree
map <C-n> : NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd QuickFixCmdPost *grep* cwindow

set et
set sw=4
set ts=4
set smarttab
set noswapfile
set number
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set autoindent
set copyindent
set smartindent
set smarttab
set foldmethod=indent
set foldlevel=99
set pastetoggle=<F2>
set clipboard=unnamed

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-t> :tabnew<CR>
map <S-h> gT
map <S-l> gt

filetype plugin on
filetype plugin indent on
syntax on

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_html_checkers=['']

au! BufRead,BufNewFile *.json set filetype=json 
au BufRead,BufNewFile *.scss set filetype=scss

augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END 

let g:user_emmet_leader_key='<C-a>'

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType twig setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" Auto pastetoggle
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" CommandT ignore directories
let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*,**/node_modules/*,**/cache/*,**/web/assets/*,**/web/js/*,**/web/css/*,**/web/bundles/*"
