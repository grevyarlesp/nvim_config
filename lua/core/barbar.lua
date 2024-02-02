vim.api.nvim_set_keymap("n", "<A-w>", ":BufferClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-.>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-,>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-<>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A->>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", { noremap = true, silent = true })
-- Goto buffer in position...
vim.api.nvim_set_keymap("n", "<A-1>", ":BufferGoto 1<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-2>", ":BufferGoto 2<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-3>", ":BufferGoto 3<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-4>", ":BufferGoto 4<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-5>", ":BufferGoto 5<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-6>", ":BufferGoto 6<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-7>", ":BufferGoto 7<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-8>", ":BufferGoto 8<CR>", {noremap =true, silent=true})
vim.api.nvim_set_keymap("n", "<A-9>", ":BufferLast<CR>", {noremap = true, silent=true})
-- vim.opt.bufferline.animation = false
--
-- Set barbar's options
--
vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
  -- Enable/disable animations
  animation = false,
  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,
  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

local ok, nvim_tree = pcall(require, 'nvim-tree')

if (not ok) then
    return
end

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua require(\'core.tree\').toggle()<CR>', {silent = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '<C-n>', '<cmd>lua require(\'core.tree\').toggle()<CR>', {silent = true, noremap = true})

-- vim.cmd([[
--     au BufHidden NvimTree vim.schedule(lua Tree_close())")
-- ]])

