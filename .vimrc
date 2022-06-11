set nocompatible
syntax on
set number
set relativenumber
set laststatus=2
set mouse+=a
nmap Q <Nop>
set hidden
set shortmess+=I
set backspace=indent,eol,start
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
