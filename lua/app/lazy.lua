local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end


require('lazy').setup({
        { import = "plugins" },
        { import = "plugins.lsp.init" },
        -- { import = "plugins.lang.typescript" },
    },
    {
        install = {
            colorscheme = { "vscode" },
        },
        change_detection = {
            notify = false,
        }
    }
)
