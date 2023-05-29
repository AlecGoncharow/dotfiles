-- sourced from https://github.com/arnvald/viml-to-lua/blob/main/lua/plugins.lua

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'
  use 'karb94/neoscroll.nvim'
  use 'edkolev/tmuxline.vim'
  use 'romainl/vim-cool'

  -- common
  use 'tpope/vim-fugitive' -- Git commands
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'rhysd/vim-grammarous' -- grammar check
  use 'andymass/vim-matchup' -- matching parens and more
  use 'rhysd/git-messenger.vim'


  use 'luochen1990/rainbow'
  use 'RRethy/vim-illuminate'
  -- better quickfix buffer
  use {'kevinhwang91/nvim-bqf',
  ft = 'qf',
  config = function()
    require("bqf").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  end
  }


  -- general dev
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
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
  use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  end
}

  -- search
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'tpope/vim-eunuch' -- wrappers UNIX commands
  use 'tpope/vim-surround' -- surround characters shortcuts
  use 'tpope/vim-vinegar' -- file browser
  use 'kyazdani42/nvim-web-devicons' -- icons when searching

  -- go
  use 'ray-x/go.nvim'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- ember
  use 'joukevandermaas/vim-ember-hbs'

  -- debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  use { "johmsalas/text-case.nvim",
  config = function()
    require('textcase').setup {}
  end
}
end)
