local nvim_lsp = require('lspconfig')
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
    local opts = { noremap=true, silent=true }

    require("lsp.nvim-lsp-keys").setup(client, bufnr)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      " 
      hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
      hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow

      " Info and Hints in White
      hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
      hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
      " Underline the offending code
      hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
      hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
      hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
      hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline
      augroup lsp_document_highlight
        autocmd! * <buffer>
        " autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        " autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- Diagnostic 
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
        spacing = 2
        , prefix = '🔙'
        }
    })
end
--
-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd" , "pyright", "texlab", "gopls"}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    on_attach = on_attach,
  }
  -- if enhance_server_opts[server.name] then
  --   -- Enhance the default opts with the server-specific ones
  --   enhance_server_opts[server.name](opts)
  -- end
  --
	-- This setup() function is exactly the same as lspconfig's setup function.
	server:setup(opts)
end)

