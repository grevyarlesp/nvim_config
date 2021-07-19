return require('packer').startup(function()
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- CORE
    -- which-key
    use { 'folke/which-key.nvim', branch= 'main'}

    -- status line
    use { 'hoob3rt/lualine.nvim',
        config = function()
            -- require('../plugconfig/nvim-lualine-config')
            require('core/lualine')
        end,
        event = "BufWinEnter"
    }
    -- commenting
    use {'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
    }

    -- Lanaguage-specific
    -- Scheme -
    use { 'Olical/conjure' }
    use {'sevko/vim-nand2tetris-syntax'}
    use {'aklt/plantuml-syntax'}
    use {'lervag/vimtex',
    config = function()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_quickfix_mode=0
        vim.g.vimtex_complete_close_braces = 1
        vim.g.tex_conceal='abdmg'
        -- set conceallevel=2
        vim.opt.conceallevel=2
    end
    }
    -- syntax for a bunch of languages
    use {'justinmk/vim-syntax-extra'} 

    -- Markdown
    use { 'iamcco/markdown-preview.nvim', opt=true, ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    
end)
