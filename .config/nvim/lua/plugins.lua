-- sourced from https://github.com/arnvald/viml-to-lua/blob/main/lua/plugins.lua

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- use 'morhetz/gruvbox'
  -- use 'tjdevries/colorbuddy.nvim'
  use 'edkolev/tmuxline.vim'
  use 'romainl/vim-cool'

  -- common
  use 'tpope/vim-fugitive' -- Git commands
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'andymass/vim-matchup' -- matching parens and more
  use 'lewis6991/gitsigns.nvim'


  use 'RRethy/vim-illuminate'
  -- better quickfix buffer
  use { 'kevinhwang91/nvim-bqf', ft = 'qf',
    config = function()
      -- Adapt fzf's delimiter in nvim-bqf
      require('bqf').setup({
        filter = {
          fzf = {
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--delimiter', '│' }
          }
        }
      })
    end
  }
  use 'matbme/JABS.nvim' -- buffer switcher


  -- general dev
  use 'neovim/nvim-lspconfig'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use "hrsh7th/cmp-path"
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'scrooloose/nerdcommenter' -- commenting shortcuts

  use 'tpope/vim-eunuch'         -- wrappers UNIX commands
  use 'tpope/vim-surround'       -- surround characters shortcuts
  use 'tpope/vim-endwise'        -- wisely add
  use 'tpope/vim-repeat'         -- repeat for plugins
  use 'tpope/vim-vinegar'        -- make explore better
  use {
    'prichrd/netrw.nvim',        -- particles for ^
    config = function()
      require("netrw").setup {
        directory = '', -- Directory icon
        file = '', -- File icon
        use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
        mappings = {}, -- Custom key mappings
      }
    end
  }

  use 'kyazdani42/nvim-web-devicons' -- icons when searching
  use { "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" }
  }


  -- zig
  use 'ziglang/zig.vim'

  -- go
  use 'ray-x/go.nvim'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- ember
  use 'joukevandermaas/vim-ember-hbs'
  use 'joerdav/templ.vim'

  -- debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- jai
  use 'rluba/jai.vim'

  use 'wsdjeg/vim-fetch'

  use { "johmsalas/text-case.nvim",
    config = function()
      require('textcase').setup {}
    end
  }

  -- integer base conversions
  use {
    "glts/vim-radical",
    requires = {
      { "glts/vim-magnum" },
    }
  }

  use 'tpope/vim-dadbod' -- SQL
  use 'nanotee/sqls.nvim'

  use 'rmagatti/auto-session'
  -- auto close delimiters because lazy
  use 'm4xshen/autoclose.nvim'

  use 'mg979/vim-visual-multi'
end)
