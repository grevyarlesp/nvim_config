return require('packer').startup(function()
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    
    -- commenting
    use {'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
    }

    -- Lanaguage-specific
    use {'sevko/vim-nand2tetris-syntax'}

    use {'aklt/plantuml-syntax'}

    use {'lervag/vimtex',
    config = function()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_quickfix_mode=0
        vim.g.vimtex_complete_close_braces = 1
        vim.g.tex_conceal='abdmg'
    end

    }

end)
