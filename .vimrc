" 
set nocompatible
" file encoding
set fenc=utf-8
" setting of backupfiles and swapfiles
set nobackup
set noswapfile
" 
set autoread
"
set showcmd
" ---------- Settings of Display ----------
set number         " display linenumber
set title          " display filename
set cursorline     " highlight current line
syntax on          " syntax highlight 
set autoindent     " 
set smartindent    " 
"set list           " display unvisible characters
" ---------- TAB ----------
set expandtab      " insert space when tab key is pressed
set tabstop=4      " set width of tab-character
set softtabstop=4  " set width of softtab
set shiftwidth=4   " set width of indentation
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
set whichwrap+=h,l


" VimPlug
call plug#begin()
Plug 'mechatroner/rainbow_csv'
call plug#end()
