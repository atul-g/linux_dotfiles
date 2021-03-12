set number
set autoindent
set smartindent
set cursorline
filetype plugin indent on
runtime macros/matchit.vim

" For python and js alone 4 tabs
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp

" This is for auto-closing parenthesis
" inoremap ( ()<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

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

call plug#end()
