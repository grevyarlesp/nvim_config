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
  extensions = {
    -- Your extension config goes in here
  }
}

vim.cmd(
[[
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files previewer=false<cr>
nnoremap <leader>fd <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>

nnoremap <leader>fc <cmd>lua require'telescope.builtin'.git_bcommits()<cr>
nnoremap <leader>fs <cmd>lua require'telescope.builtin'.git_status()<cr>
" nnoremap <leader>fs <cmd>lua require'telescope.builtin'.git_status()<cr>

nnoremap <leader>fz <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>
nnoremap <leader>ft <cmd>lua require'telescope.builtin'.treesitter()<cr>

]])

