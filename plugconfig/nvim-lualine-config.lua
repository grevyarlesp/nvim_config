-- Ref: https://github.com/jubnzv/dotfiles/blob/dd46c2d940c13a0db8d94b02934659018358579a/.config/nvim/init.vim#L208-L212
vim.cmd([[
function! CurrentFunctionVista() abort
  let l:method = get(b:, 'vista_nearest_method_or_function', '')
  if l:method != ''
    let l:method = '| ' . l:method
  endif
  return l:method
endfunction
]])

require('lualine').setup{
    options = {
        theme = 'tokyonight',
        -- section_separators = {'', ''},
        section_separators = {'' , ''},
        -- section_separators = {'', ''},
        component_separators = {'', ''},
        disabled_filetypes = {},
        icons_enabled = true,
    },

    sections = {
        lualine_a = { {'mode', upper = false} },
        lualine_b = { {'FugitiveHead', icon = ''} },
        lualine_c = { {'filename', file_status = true}},
        lualine_x = { {'diagnostics', sources={'nvim_lsp'}}, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location'  },
    },
    inactive_sections = {
        lualine_a = {  },
        lualine_b = {  },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {  },
        lualine_z = {   }
    },
}

