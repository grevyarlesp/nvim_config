local saga = require 'lspsaga'

saga.init_lsp_saga {
    finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    definition_preview_icon = '  '
}
vim.cmd([[
    nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

    " show
    " nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

    nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
    " only show diagnostic if cursor is over the area
    nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

    " jump diagnostic
    " nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
    " nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
]])
