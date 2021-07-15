let g:deoplete#enable_at_startup = 1
inoremap <expr><A-q> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"
inoremap <expr><A-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><A-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><A-l> pumvisible() ? "\<CR>" : ""
inoremap <expr><A-o> deoplete#mappings#manual_complete()
call deoplete#custom#source('_',
  \ 'matchers', ['matcher_full_fuzzy'])

set completeopt-=preview
