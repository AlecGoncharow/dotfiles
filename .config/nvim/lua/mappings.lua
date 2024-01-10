-- https://github.com/arnvald/viml-to-lua/blob/main/lua/mappings.lua
vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function Map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Nmap(shortcut, command)
  Map('n', shortcut, command)
end

function Imap(shortcut, command)
  Map('i', shortcut, command)
end

function Vmap(shortcut, command)
  Map('v', shortcut, command)
end

function Cmap(shortcut, command)
  Map('c', shortcut, command)
end

function Tmap(shortcut, command)
  Map('t', shortcut, command)
end

--- pane nav
Nmap("<c-k>", ":wincmd k<CR>")
Nmap("<c-j>", ":wincmd j<CR>")
Nmap("<c-h>", ":wincmd h<CR>")
Nmap("<c-l>", ":wincmd l<CR>")

-- pane spawn
Nmap("t", ':split<CR>:wincmd j<CR>:term<CR>a')
Nmap("s", ':vs<CR>:wincmd l<CR>')

-- escape terminal mode easier
Tmap('<Esc>', '<C-\\><C-n>')
