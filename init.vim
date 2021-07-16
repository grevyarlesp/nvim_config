
"========================================
"|_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
" | ||  \| || |  | |  \ \ / / | || |\/| |
" | || |\  || |  | |_  \ V /  | || |  | |
"|___|_| \_|___| |_(_)  \_/  |___|_|  |_|
"========================================

" Plugins with vim-plug

call plug#begin('~/.config/nvim/plugged')
Plug 'ActivityWatch/aw-watcher-vim'
" which key
Plug 'folke/which-key.nvim', {'branch': 'main'}
" Image paste
Plug 'ferrine/md-img-paste.vim'

Plug 'andweeb/presence.nvim', {'branch':'main'}
Plug 'jpalardy/vim-slime', {'branch':'main'}             " REPL integraion
Plug 'neovim/nvim-lspconfig'

Plug 'Olical/conjure', {'tag': 'v4.19.0'}
Plug 'Olical/aniseed', { 'tag': 'v3.18.0' }

Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/fcitx.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/playground'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'ludovicchabant/vim-gutentags'   " Auto (re)generate tag files
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
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
Plug 'mhinz/vim-signify'
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

" indent 
Plug 'Yggdroot/indentLine'
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
source ~/.config/nvim/basic.vim

" Plugin configs {{{
source ~/.config/nvim/better-sml-config.vim
source ~/.config/nvim/quick-scope-config.vim
source ~/.config/nvim/vimwiki-config.vim
source ~/.config/nvim/vim-easyescape-config.vim
source ~/.config/nvim/vim-gutentags-config.vim
source ~/.config/nvim/vim-slime-config.vim
source ~/.config/nvim/barbar-config.vim
source ~/.config/nvim/signify-config.vim
source ~/.config/nvim/lspsaga-config.vim

luafile ~/.config/nvim/nvim-lspconfig.lua
luafile ~/.config/nvim/nvim-treesitter-config.lua
luafile ~/.config/nvim/nvim-lualine-config.lua
luafile ~/.config/nvim/telescope-config.lua
luafile ~/.config/nvim/nvim-lspsaga-config.lua
luafile ~/.config/nvim/presence-config.lua
luafile ~/.config/nvim/nvim-compe-config.lua
" luafile ~/.config/nvim/nvim-ts-rainbow-config.lua 
" luafile ~/.config/nvim/neuron-config.lua
luafile ~/.config/nvim/which-key.lua

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


let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0
nnoremap <leader>ti :IndentLinesToggle<cr>


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
"
"highlighted yank
" augroup highlight_yank
"     autocmd!
"     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
" augroup END
" {{{
