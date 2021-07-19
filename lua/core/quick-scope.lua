vim.cmd([[
" Trigger a highlight in the appropriate direction when pressing these keys:

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
augroup END
" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/xmap instead of their non-recursive versions (nnoremap/xnoremap).nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)
]])
