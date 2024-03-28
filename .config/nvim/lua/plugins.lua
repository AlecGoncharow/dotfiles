return require('lazy').setup({
  -- neorg
  {
    "vhyrro/luarocks.nvim",
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    version = "*", -- Pin Neorg to the latest stable release
  },
  'edkolev/tmuxline.vim',
  'romainl/vim-cool',
  -- common
  'kyazdani42/nvim-web-devicons',
  'tpope/vim-fugitive', -- Git commands
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',
  'andymass/vim-matchup', -- matching parens and more
  'RRethy/vim-illuminate',
  -- better quickfix buffer
  'kevinhwang91/nvim-bqf',
  'matbme/JABS.nvim', -- buffer switcher
  -- general dev
  'neovim/nvim-lspconfig',
  { 'glepnir/lspsaga.nvim',            branch = "main" },

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'scrooloose/nerdcommenter', -- commenting shortcuts

  'tpope/vim-eunuch',         -- wrappers UNIX commands
  'tpope/vim-surround',       -- surround characters shortcuts
  'tpope/vim-endwise',        -- wisely add
  'tpope/vim-repeat',         -- repeat for plugins
  -- 'tpope/vim-vinegar', -- make explore better
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'prichrd/netrw.nvim', -- particles for ^
    opts = {
      directory = '', -- Directory icon
      file = '', -- File icon
      use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
      mappings = {}, -- Custom key mappings
    }
  },

  'ibhagwan/fzf-lua',

  -- zig
  'ziglang/zig.vim',
  -- go
  'ray-x/go.nvim',

  -- rust
  'rust-lang/rust.vim',
  'simrat39/rust-tools.nvim',

  -- ember
  'joukevandermaas/vim-ember-hbs',
  'joerdav/templ.vim',

  -- debugging
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-dap',

  -- jai
  'rluba/jai.vim',

  'johmsalas/text-case.nvim',

  -- integer base conversions
  'glts/vim-radical',
  'glts/vim-magnum',

  -- SQL
  'tpope/vim-dadbod',
  'nanotee/sqls.nvim',

  'rmagatti/auto-session',
  -- auto close delimiters because lazy
  'm4xshen/autoclose.nvim',

  'mg979/vim-visual-multi',
})
