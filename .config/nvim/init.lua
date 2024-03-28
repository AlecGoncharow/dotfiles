local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')
require('settings')
require('mappings')
require('fzf')
require('lsp')
require('treesitter')
require('highlighting')
require('autocomplete')
require('powerline')
require('git')
require('jabs_conf')
require('lspsaga_conf')
require('nerdcommenter_conf')
require('bqf_conf')
require('autosession_conf')
require('autoclose_conf')
require('buffers')
require('oil_conf')
require('neorg_conf') -- note taking

if vim.g.neovide then
  require('neovide_conf')
end

--- basic plugins setup
require('autoclose').setup()
