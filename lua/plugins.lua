return require('packer').startup(function()
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- CORE
    use { 'neovim/nvim-lspconfig' }
    
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim',
        config = function()
            require('core.telescope')
        end
    }

    use {'unblevable/quick-scope',
        config = function()
            require('core.quick-scope')
        end
    }
    -- status line
    use { 'hoob3rt/lualine.nvim',
        config = function()
            -- require('../plugconfig/nvim-lualine-config')
            require('core.lualine')
        end,
        event = "BufWinEnter"
    }
    -- commenting
    use {'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end
    }

    -- Can't load this lazily
    use {'JuliaEditorSupport/julia-vim'}

    -- Lanaguage-specific
    -- Scheme -
    use {'Olical/aniseed'
    }
    use { 'Olical/conjure',
        ft={"scheme"}
    }
    use {'sevko/vim-nand2tetris-syntax'}

    -- Plantuml
    use {'aklt/plantuml-syntax', ft="plantuml"}
    use {'weirongxu/plantuml-previewer.vim', ft="plantuml"}

    use {'lervag/vimtex',
    ft = {"tex"},
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

    use { 'ferrine/md-img-paste.vim', ft = {'markdown'} }
    
end)
