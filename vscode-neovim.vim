call plug#begin('~/.config/nvim/plugged')
Plug 'dhruvasagar/vim-table-mode'
Plug 'unblevable/quick-scope'
call plug#end()
" {{{ Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
xmap <leader>q <plug>(QuickScopeToggle)
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" }}}

" {{{ VSCodeCommentary 
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
" }}}
"

" {{{ table-mode
let g:table_mode_map_prefix = ',t'
let g:table_mode_delete_row_map = ',tdd'
let g:table_mode_delete_column_map = ',tdc'
" }}}
