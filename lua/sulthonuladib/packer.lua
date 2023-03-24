vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- nvim tree things
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'nvim-tree/nvim-web-devicons'
    use 'karb94/neoscroll.nvim'
    use {
      'Equilibris/nx.nvim',
      config = function()
        require('nx.nvim').setup{
          -- Base command to run all other nx commands, some other values may be:
          -- - `npm nx`
          -- - `yarn nx`
          -- - `pnpm nx`
          nx_cmd_root = 'nx',

          -- Command running capabilities,
          -- see nx.m.command-runners for more details
          command_runner = require('nx.command-runners').terminal_command_runner(),
          -- Form rendering capabilities,
          -- see nx.m.form-renderers for more detials
          form_renderer = require('nx.form-renderers').telescope_form_renderer(),

          -- Whether or not to load nx configuration,
          -- see nx.loading-and-reloading for more details
          read_init = true,
        }
      end
    }
  end)
