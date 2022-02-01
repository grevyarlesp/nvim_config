set tabstop=4
set shiftwidth=4
set expandtab
set number
set smartindent

set nocompatible
set ai
set scrolloff=999
set sidescrolloff=999
set mouse=a

" set clipboard=unnamedplus
filetype plugin indent on
" Syntax highlighting
syntax on
" Stop vim from wrapping lines at a middle of a word
set nowrap
" set cursorline
set linebreak
let mapleader = "\<Space>"
set encoding=utf-8

filetype plugin on

set imdisable iminsert=0 imsearch=-1
set listchars=tab:▸\ ,eol:¬
" set listchars=eol:¬,tab:▸\
" set space:␣
set list
set ruler
" set relativenumber
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


set ttimeoutlen=50
set nohlsearch

set laststatus=2
set termguicolors
set t_Co=256

" Blocky cursor
set guicursor=
let g:python3_host_prog  = '/usr/bin/python3'

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set shell=/bin/bash
