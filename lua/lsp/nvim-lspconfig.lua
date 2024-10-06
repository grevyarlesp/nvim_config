local mason = require("mason")
mason.setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)
local ok, mason_lsp = pcall(require, "mason-lspconfig")

local servers = { "clangd", "pyright", "texlab", "gopls", "rust_analyzer", "lua_ls", "rnix" }

mason_lsp.setup({
    ensure_installed = servers,
    automatic_installation = true,
})



local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    --
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
                ,
                prefix = '🔙'
            }
        })
end

-- mason_lsp.setup_handlers {
--     function (server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {
--             on_attach = on_attach,
--         }
--     end,
-- }



local nvim_lsp = require('lspconfig')
for i, server in ipairs(servers) do
    nvim_lsp[server].setup { on_attach = on_attach }
end
