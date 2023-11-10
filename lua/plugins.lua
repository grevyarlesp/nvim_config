return require('packer').startup(function(use)

  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    use {'wakatime/vim-wakatime'}
    use {
        'glacambre/firenvim',
        run = function() 
            vim.fn['firenvim#install'](0) 
        end 
    }


    use { 'Mofiqul/vscode.nvim',
        config = function()
            vim.o.background = "dark" -- to load onelight
            -- vim.g.vscode_style = "dark"
            vim.cmd([[colorscheme vscode]])
        end
    }


    use {'andweeb/presence.nvim',
        config = function()
            require("presence"):setup({
                -- General options
                auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
                main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
                client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
                log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = false,                      -- Displays the current line number instead of the current project
                blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

                -- Rich Presence text options
                editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            })
        end
    }

    -- GIT
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

    -- use {'folke/tokyonight.nvim', branch= 'main'}
    -- use {'olimorris/onedarkpro.nvim', branch= 'main'}

    -- COR
    --
    -- use {'williamboman/nvim-lsp-installer'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use { 'neovim/nvim-lspconfig' ,config = function() 
        require('lsp.nvim-lspconfig')
    end}

    use {'hrsh7th/cmp-nvim-lsp'}
    -- use {'hrsh7th/cmp-buffer'  }
    use {'hrsh7th/cmp-path'    }
    -- use {'hrsh7th/cmp-cmdline' }
    use {"quangnguyen30192/cmp-nvim-ultisnips",
            config = function()
              -- optional call to setup (see customization section)
                  require("cmp_nvim_ultisnips").setup{}
            end
    }
    use {'hrsh7th/nvim-cmp'}

    use {'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("lsp.null-ls-config")
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
        -- vim.g.vimtex_view_general_viewer = 'zathura'

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

    -- Database
    use {'tpope/vim-dadbod'}
    -- syntax for a bunch of languages
    use {'justinmk/vim-syntax-extra'}

    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require('lsp.metals')
    end})

    -- Markdown
    use { 'ferrine/md-img-paste.vim', ft = {'markdown'} }
    --
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
