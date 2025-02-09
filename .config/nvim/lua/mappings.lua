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

-- pane nav
Nmap("<leader>u", ":wincmd k<CR>")
Nmap("<leader>e", ":wincmd j<CR>")
Nmap("<leader>n", ":wincmd h<CR>")
Nmap("<leader>i", ":wincmd l<CR>")

-- -- pane resize
-- Nmap("_", ":resize -1<CR>")
-- Nmap("+", ":resize +1<CR>")

-- pane spawn
Nmap("<leader>t", ':split<CR>:wincmd j<CR>:term<CR>')
Nmap("<leader>s", ':vs<CR>:wincmd l<CR>')
Nmap("<leader>wo", ':only<CR>')

-- escape terminal mode easier
Tmap('<Esc>', '<C-\\><C-n>')


-- yoinked from https://github.com/dycw/dotfiles/blob/master/nvim/lua/keymaps.lua
local function merge_tables(t1, t2)
  local result = {}
  for key, value in pairs(t1) do
    result[key] = value
  end
  for key, value in pairs(t2) do
    result[key] = value
  end
  return result
end

local keymap_opts = { noremap = true, silent = true }

local keymap_set = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, merge_tables(keymap_opts, { desc = desc }))
end
-- command
keymap_set("n", ";", ":", "Command")

-- global marks
local prefixes = "m'"
local letters = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #prefixes do
  local prefix = prefixes:sub(i, i)
  for j = 1, #letters do
    local lower_letter = letters:sub(j, j)
    local upper_letter = string.upper(lower_letter)
    keymap_set({ "n", "v" }, prefix .. lower_letter, prefix .. upper_letter, "Mark " .. upper_letter)
  end
end

-- paste in insert mode
keymap_set("i", "<C-v>", "<C-o>p", "Paste")
