return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "typescript-language-server",
                "eslint-lsp",
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            vim.list_extend(opts.sources, {
                -- nls.builtins.formatting.biome,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                eslint = {
                    settings = {
                        -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
                        workingDirectory = { mode = "auto" },
                    },
                },
                -- biome = {},
            },
            setup = {
                eslint = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function(event)
                            local client = vim.lsp.get_clients({ bufnr = event.buf, name = "eslint" })[1]
                            if client then
                                local diag = vim.diagnostic.get(event.buf,
                                    { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                                if #diag > 0 then
                                    vim.cmd("EslintFixAll")
                                end
                            end
                        end,
                    })
                end,
                tsserver = function()
                    -- skip mason-lspconfig auto setup
                    return true
                end,
            },
        },
    },
}
