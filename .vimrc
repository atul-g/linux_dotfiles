set number
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cursorline
filetype plugin indent on

:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
