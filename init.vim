"========================================
"|_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
" | ||  \| || |  | |  \ \ / / | || |\/| |
" | || |\  || |  | |_  \ V /  | || |  | |
"|___|_| \_|___| |_(_)  \_/  |___|_|  |_|
"========================================

set tabstop=4
set shiftwidth=4

set expandtab
set number
set autoindent

set nocompatible
set ai
set scrolloff=999
set sidescrolloff=999
set mouse=a

filetype plugin on
filetype plugin indent on

" Syntax highlighting
syntax on
" Stop vim from wrapping lines at a middle of a word
set nowrap

" set cursorline
set linebreak
let mapleader = "\<Space>"
set encoding=utf-8

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

" Plugins with vim-plug

call plug#begin('~/.config/nvim/plugged')
" which key
Plug 'folke/which-key.nvim', {'branch': 'main'}
" Image paste
Plug 'ferrine/md-img-paste.vim'

Plug 'andweeb/presence.nvim', {'branch':'main'}
Plug 'jpalardy/vim-slime', {'branch':'main'}             " REPL integraion
Plug 'neovim/nvim-lspconfig'

Plug 'Olical/conjure',
Plug 'Olical/aniseed', 

Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/fcitx.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/playground'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim', {'branch' : 'main'}
" Markdown preview 
"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Telescope

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"
Plug 'jbyuki/nabla.nvim'

" PLant uml
" Syntax highlight for PlantUML

Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" PLS 


Plug 'JuliaEditorSupport/julia-vim'

Plug 'derekwyatt/vim-fswitch'
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'justinmk/vim-syntax-extra'
Plug 'zhou13/vim-easyescape'
Plug 'folke/tokyonight.nvim', {'branch':'main'}
let g:tokyonight_style='night'
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
" Git integration
Plug 'lewis6991/gitsigns.nvim', {'branch':'main'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'


Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/custom_snippets"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'jez/vim-better-sml'

Plug 'lervag/vimtex'

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_complete_close_braces = 1
let g:tex_conceal='abdmg'

Plug 'tpope/vim-commentary'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" Status line
Plug 'hoob3rt/lualine.nvim'

cal plug#end()
" Auto Insert Header
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kk
endfunction

autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
imap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
imap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
imap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
imap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
imap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
imap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

colorscheme tokyonight
set background=dark

" basic configurations 

" Plugin configs {{{
source ~/.config/nvim/plugconfig/better-sml-config.vim
source ~/.config/nvim/plugconfig/quick-scope-config.vim
source ~/.config/nvim/plugconfig/vimwiki-config.vim
source ~/.config/nvim/plugconfig/vim-easyescape-config.vim
source ~/.config/nvim/plugconfig/vim-slime-config.vim
source ~/.config/nvim/plugconfig/barbar-config.vim
source ~/.config/nvim/plugconfig/lspsaga-config.vim

luafile ~/.config/nvim/plugconfig/nvim-lspconfig.lua
luafile ~/.config/nvim/plugconfig/nvim-treesitter-config.lua
luafile ~/.config/nvim/plugconfig/nvim-lualine-config.lua
luafile ~/.config/nvim/plugconfig/telescope-config.lua
luafile ~/.config/nvim/plugconfig/nvim-lspsaga-config.lua
luafile ~/.config/nvim/plugconfig/presence-config.lua
luafile ~/.config/nvim/plugconfig/nvim-compe-config.lua
luafile ~/.config/nvim/plugconfig/which-key.lua
" luafile ~/.config/nvim/plugconfig/gitsigns.lua



" luafile ~/.config/nvim/nvim-ts-rainbow-config.lua 
" luafile ~/.config/nvim/neuron-config.lua
" }}}

" Plugins config - too small to deserve their own files {{{ 

" {{{ FSwitch bindings
nnoremap <silent> <leader>h :FSHere<cr>
nnoremap <silent> <leader>oh :FSSplitLeft<cr>
nnoremap <silent> <leader>oj :FSSplitBelow<cr>
nnoremap <silent> <leader>ok :FSSplitAbove<cr>
nnoremap <silent> <leader>ol :FSSplitRight<cr>

au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"
let b:fswitchlocs='./'

" }}}

" }}}
"
" {{{ nabla
nnoremap <F4> :lua require("nabla").place_inline()<CR>
" }}}

" {{{ table-mode
let g:table_mode_map_prefix = ',t'
let g:table_mode_delete_row_map = ',tdd'
let g:table_mode_delete_column_map = ',tdc'
" }}}


" {{{ Plant UML
au! BufNewFile,BufReadPost *.{uml,puml} set filetype=plantuml
" }}}"

" {{{ Chad tree
"
nnoremap <leader>v <cmd>CHADopen<cr>
" }}}
"
" {{{ md-img-paste
"
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'
" }}}

" autocmd BufNewFile,BufRead *.c source ~/.config/nvim/c.vim
" autocmd BufNewFile,BufRead *.cpp source ~/.config/nvim/cpp.vim
" autocmd BufNewFile,BufRead *.hs source ~/.config/nvim/hs.vim

hi Comment ctermfg=lightgreen guifg=lightgreen
hi Comment ctermfg=lightgreen guifg=lightgreen
hi LineNr guifg=lightgreen
hi! link SignColumn LineNr
hi clear Conceal

" }}} 

" {{{
nmap <A-0> :TagbarToggle<CR>

" }}}
" highlighted yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
" {{{
