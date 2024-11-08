return {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        require('vscode').setup(
            {
                color_overrides = {
                    vscBack = '#000000',
                }
            }
        )
        vim.cmd([[colorscheme vscode]])
    end
}
