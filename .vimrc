set number
set autoindent
set smartindent
set cursorline
set hlsearch
filetype plugin indent on
runtime macros/matchit.vim

" For python and js alone 4 tabs
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype markdown setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" 2 tabs for yaml, also takes care of "-" indentations
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

" This is for auto-closing parenthesis
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" This is a binding to enable Escaping insert mode via pressing "jj"
" To type literall "jj" one needs to press j for a second and then
" enter the second j.
inoremap jj <ESC>

" This saves undo trees of a file, so you can access them even after
" closing those files:
"set undofile
"set undodir=~/.vim/undo

" number of undo saved
"set undolevels=1000


" My custom bindings for navigating across tabs:
map <C-j> gt
map <C-k> gT

let g:NERDTreeWinSize=30


" VIM-PLUG - plugin manager
" VIM-PLUG depends on git, make sure you have git installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Installing plugins:
call plug#begin('~/.vim/plugged')

" jsx/react plugin
Plug 'maxmellon/vim-jsx-pretty'

" nerdtree plugin
Plug 'preservim/nerdtree'

" automatic brace create/delete
Plug 'jiangmiao/auto-pairs'

call plug#end()
