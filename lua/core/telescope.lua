require("telescope").setup {
  defaults = {
    -- Your defaults config goes in here
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- Right hand side can also be the name of the action as a string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    find_files = {
      theme = "dropdown"
    }
  },
  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  extensions = {
    -- Your extension config goes in here
  }

}

vim.cmd(
[[
" Find files using Telescope command-line sugar.
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

nnoremap <leader>gc <cmd>lua require'telescope.builtin'.git_bcommits()<cr>
nnoremap <leader>gs <cmd>lua require'telescope.builtin'.git_status()<cr>

" nnoremap <leader>fz <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>
" nnoremap <leader>ft <cmd>lua require'telescope.builtin'.treesitter()<cr>

]])

vim.api.nvim_set_keymap('n', '<leader>ff', [[<Cmd>lua require'telescope.builtin'.find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fr', [[<Cmd>lua require'telescope.builtin'.lsp_references()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', [[<Cmd>lua require'telescope.builtin'.treesitter()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fz', [[<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tg', [[<Cmd>lua require'telescope.builtin'.tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tk', [[<Cmd>lua require'telescope.builtin'.keymaps()<CR>]], { noremap = true, silent = true })

