require'bufferline'.setup{
  options = {
     numbers = "buffer_id",
     number_style = "", -- buffer_id at index 1, ordinal at index 2

    indicator_icon = '▎',
    diagnostics = "nvim_lsp",
    left_trunc_marker = '',
    right_trunc_marker = '',
    persist_buffer_sort = true,
    always_show_bufferline = true,
    diagnostics_indicator = function(count, level, diagnostics_dict)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}

vim.cmd([[
    " These commands will navigate through buffers in order regardless of which mode you are using
    " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent>[b :BufferLineCycleNext<CR>
    nnoremap <silent>b] :BufferLineCyclePrev<CR>

    " These commands will move the current buffer backwards or forwards in the bufferline
    " nnoremap <silent><mymap> :BufferLineMoveNext<CR>
    " nnoremap <silent><mymap> :BufferLineMovePrev<CR>

    " These commands will sort buffers by directory, language, or a custom criteria
    nnoremap <silent>be :BufferLineSortByExtension<CR>
    nnoremap <silent>bd :BufferLineSortByDirectory<CR>
    nnoremap <silent> gb :BufferLinePick<CR>
    " nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
]])
