local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    --
    require("plugins.lsp.keymaps").setup(client, bufnr)

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

return {
    {
        'williamboman/mason.nvim',
        config = function()
            local mason = require("mason")
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            local mason_lsp = require("mason-lspconfig")

            local servers = { "clangd", "pyright", "texlab", "gopls", "rust_analyzer", "lua_ls", "rnix" }

            mason_lsp.setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local nvim_lsp = require('lspconfig')

            local servers = { "clangd", "pyright", "texlab", "gopls", "rust_analyzer", "lua_ls", "rnix" }
            for _, server in ipairs(servers) do
                nvim_lsp[server].setup { on_attach = on_attach }
            end

            nvim_lsp.lua_ls.setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = 'space',
                                indent_size = 2,
                                column_width = 80
                            }
                        }
                    }
                }
            })
        end
    }
}
