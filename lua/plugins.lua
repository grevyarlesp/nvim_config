return require('packer').startup(function(use)
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- GIT
    --
    use {'lewis6991/gitsigns.nvim', branch='main',
    config = function()
        require('core.gitsigns')
    end
    }

    use {'tpope/vim-fugitive' }
    use {'tpope/vim-rhubarb' }
    use {'junegunn/gv.vim' }

    use { 'luochen1990/rainbow',
    config = function()
        vim.g.rainbow_active = 1
    end

    }
    -- Tag generators
    --
    use { 'preservim/tagbar' }
    use {'ludovicchabant/vim-gutentags' }

    --

    use {'kyazdani42/nvim-web-devicons'}
    use {'andweeb/presence.nvim', branch='main',
        config = function()
            require('core.presence')
        end
    }

    use {'folke/tokyonight.nvim', branch= 'main'}
    -- COR
    use { 'neovim/nvim-lspconfig' }

    use {'glepnir/lspsaga.nvim', branch='main',
        config = function()
            require('core.lspsaga')
        end
    }

    use {'hrsh7th/nvim-compe',
        config = function()
            require('core.nvim-compe')
        end
    }

    use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate',
        config = function() 
            require('core.nvim-treesitter')
        end
    }
    use {'nvim-treesitter/playground'}
    
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
            require('core.lualine')
        end,
        event = "BufWinEnter"
    }

    use {'romgrk/barbar.nvim',
        config = function()
            require('core.barbar')
        end,
        event = "BufWinEnter",
    }
    -- commenting
    use {'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end
    }

    --- EXTRA ---
    use { 'jpalardy/vim-slime', branch='main'}
    -- REPL integraion

    use { 'dhruvasagar/vim-table-mode'}
    use { 'vim-scripts/fcitx.vim'}
    use { 'tyru/open-browser.vim'}
    use { 'ms-jpq/chadtree', branch= 'chad', run = 'python3 -m chadtree deps'}
    use { 'derekwyatt/vim-fswitch'}
    use { 'vimwiki/vimwiki'}
    use { 'junegunn/vim-easy-align'}
    use { 'SirVer/ultisnips',
        config = function()
            vim.g.UltiSnipsSnippetDirectories={"~/.config/nvim/custom_snippets"}
            vim.g.UltiSnipsExpandTrigger = '<tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        end
    }

    -- Lanaguage-specific
    -- Can't load this lazily
    use {'JuliaEditorSupport/julia-vim'}

    -- Scheme -
    use {'Olical/aniseed'}
    use { 'Olical/conjure',
        ft={"scheme"}
    }
    use {'sevko/vim-nand2tetris-syntax'}

    -- Plantuml
    use {'aklt/plantuml-syntax', ft="plantuml"}
    use {'weirongxu/plantuml-previewer.vim', ft="plantuml"}

    use {'lervag/vimtex',
    ft = {"tex"},
    }
    -- syntax for a bunch of languages
    use {'justinmk/vim-syntax-extra'} 

    -- Markdown
    use { 'iamcco/markdown-preview.nvim', opt=true, ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    use { 'ferrine/md-img-paste.vim', ft = {'markdown'} }
    
end)
