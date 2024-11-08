--[[
 ___ _   _ ___ _____ _    _   _   _
|_ _| \ | |_ _|_   _| |  | | | | / \
 | ||  \| || |  | | | |  | | | |/ _ \
 | || |\  || |  | |_| |__| |_| / ___ \
|___|_| \_|___| |_(_)_____\___/_/   \_\
]]
--

vim.g.mapleader = ' '

require("app.keymappings").load_defaults()
require("app.lazy")

vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true

vim.opt.compatible = false
vim.opt.ai = true
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 999

vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')

-- Syntax highlighting
vim.cmd('syntax on')
-- Stop vim from wrapping lines at a middle of a word
vim.opt.wrap = false

-- vim.opt.cursorline = true
vim.opt.linebreak = true
vim.opt.encoding = 'utf-8'

vim.cmd('set imdisable iminsert=0 imsearch=-1')
vim.opt.listchars = { tab = '▸ ', eol = '¬' }
vim.opt.list = true
vim.opt.ruler = true

-- Remove arrow keys in different modes
vim.api.nvim_set_keymap('c', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Up>', '<Nop>', { noremap = true })

vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })

vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', { noremap = true })

vim.opt.ttimeoutlen = 50
vim.opt.hlsearch = false

vim.opt.laststatus = 2
vim.opt.termguicolors = true

-- Clipboard mappings
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yg_', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true })
