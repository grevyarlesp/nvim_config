local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')

-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind 
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.config({
    current_function = true,
    indicator_errors = ' ',
    indicator_warnings = ' ',
    indicator_info = 'i',
    indicator_hint = '?',
    indicator_ok = 'Ok',
})

lsp_status.register_progress()

lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})


