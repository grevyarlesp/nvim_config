require('lualine').setup{
    options = {
        -- theme = 'onedark',
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
        lualine_x = { {'diagnostics', sources={'nvim_diagnostic'}}, 'encoding', 'fileformat', 'filetype' },
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
    extensions = {
        'nvim-tree', 'fugitive'
    },
}
