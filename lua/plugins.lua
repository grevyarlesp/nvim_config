return require('packer').startup(function(use)
    use {'ActivityWatch/aw-watcher-vim'}

  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- GIT
    --
    use {'lewis6991/gitsigns.nvim', branch='main',
      requires = {
        'nvim-lua/plenary.nvim'
      },
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

    use {'kyazdani42/nvim-web-devicons'}

    use {'folke/tokyonight.nvim', branch= 'main'}
    -- use {'olimorris/onedarkpro.nvim', branch= 'main'}

    -- COR
    use { 'neovim/nvim-lspconfig' }

    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'  }
    use {'hrsh7th/cmp-path'    }
    use {'hrsh7th/cmp-cmdline' }

    use {'hrsh7th/nvim-cmp',
        requires = {

            "quangnguyen30192/cmp-nvim-ultisnips",
            config = function()
              -- optional call to setup (see customization section)
                  require("cmp_nvim_ultisnips").setup{}
            end,
        },
        config = function()
            require('core.nvim-cmp')
        end
    }


    use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate',
        config = function()
            require('core.nvim-treesitter')
        end
    }
    -- use {'nvim-treesitter/nvim-treesitter',
    --     commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
    --     config = function() 
    --         require('core.nvim-treesitter')
    --     end
    -- }
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
    use { 'nvim-lualine/lualine.nvim',
        config = function()
            require('core.lualine')
        end,
        event = "BufWinEnter"
    }
    use { 'kyazdani42/nvim-tree.lua',
        config = function()
            require('core.nvim-tree')
        end
    }

    use {'romgrk/barbar.nvim',
        config = function()
            require('core.barbar')
        end,
        event = "BufWinEnter",
    }


    -- Comment --
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    }
    --- EXTRA ---
    use { 'jpalardy/vim-slime', branch='main'}
    -- REPL integraion

    use { 'dhruvasagar/vim-table-mode'}
    use {'lilydjwg/fcitx.vim'}
    use { 'tyru/open-browser.vim'}


    use { 'derekwyatt/vim-fswitch'}
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
    -- use {'JuliaEditorSupport/julia-vim'}

    -- Scheme -
    --
    -- Nand 2 tetrix
    use {'sevko/vim-nand2tetris-syntax'}

    -- Plantuml
    use {'aklt/plantuml-syntax', ft="plantuml"}
    use {'weirongxu/plantuml-previewer.vim', ft="plantuml"}

    -- Latex

    use {'lervag/vimtex',
    -- ft = {"tex"},
    config = function()
        vim.opt.conceallevel=2
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_quickfix_mode=0
        vim.g.vimtex_complete_close_braces = 1
        vim.g.tex_conceal='abdmg'
        vim.g.vimtex_compiler_latexmk = {
             executable = 'latexmk',
             options = {
                -- '-xelatex',
               '-shell-escape',
               '-file-line-error',
               '-synctex=1',
               '-interaction=nonstopmode'
           } }
    end
    }
    -- syntax for a bunch of languages
    --
    use {'justinmk/vim-syntax-extra'}
    -- Python
    -- Jupyter
    use {'untitled-ai/jupyter_ascending.vim'}

    -- Markdown
    use { 'iamcco/markdown-preview.nvim', opt=true, ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use { 'ferrine/md-img-paste.vim', ft = {'markdown'} }
    --
end)
