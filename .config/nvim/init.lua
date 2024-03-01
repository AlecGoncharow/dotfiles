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

if vim.g.neovide then
  require('neovide_conf')
end

--- basic plugins setup
require('autoclose').setup()
