return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local lazy_status = require("lazy.status")
        require('lualine').setup {
            options = {
                -- section_separators = {'', ''},
                section_separators = { '', '' },
                component_separators = { '', '' },
                disabled_filetypes = {},
                icons_enabled = true,
            },

            sections = {
                lualine_a = { { 'mode', upper = false } },
                lualine_b = { { 'FugitiveHead', icon = '' } },
                lualine_c = { { 'filename', file_status = true } },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" }
                    },
                    { 'diagnostics', sources = { 'nvim_diagnostic' } }, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            extensions = {
                'nvim-tree', 'fugitive'
            },
        }
    end,
    event = "BufWinEnter"
}
