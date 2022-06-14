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

local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

local tlb = require'telescope.builtin'

map('n', '<leader>ffr', tlb.find_files, { noremap = true, silent = true })
map('n', '<leader>td', tlb.grep_string, { noremap = true, silent = true })
map('n', '<leader>fg', tlb.live_grep, { noremap = true, silent = true })
map('n', '<leader>tb', tlb.buffers, { noremap = true, silent = true })
map('n', '<leader>lr', tlb.lsp_references, { noremap = true, silent = true })
map('n', '<leader>ts', tlb.treesitter, { noremap = true, silent = true })
map('n', '<leader>fz', tlb.current_buffer_fuzzy_find, { noremap = true, silent = true })
map('n', '<leader>tg', tlb.tags, { noremap = true, silent = true })
map('n', '<leader>tk', tlb.keymaps, { noremap = true, silent = true })
map('n', '<leader>gs', tlb.git_status, { noremap = true, silent = true })
map('n', '<leader>gb', tlb.git_branches, { noremap = true, silent = true })
map('n', '<leader>gc', tlb.git_commits, { noremap = true, silent = true })
map('n', '<leader>fh', tlb.help_tags, { noremap = true, silent = true })
map('n', '<leader>tr', tlb.registers, { noremap = true, silent = true })


