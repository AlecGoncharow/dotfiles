local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzf.files, {})
vim.keymap.set('n', '<leader>fg', fzf.live_grep, {})
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, {})
vim.keymap.set('n', '<leader>fW', fzf.grep_cWORD, {})
vim.keymap.set('v', '<leader>ff', fzf.grep_visual, {})

vim.keymap.set('n', '<c-f>', fzf.grep_curbuf, {})