vim.cmd([[
  syntax enable
  filetype plugin indent on
]])

HOME                  = os.getenv("HOME")

vim.g.mapleader       = ' '

vim.wo.cursorline     = true
vim.opt.termguicolors = true

-- basic settings
vim.o.encoding        = "utf-8"
vim.o.backspace       = "indent,eol,start" -- backspace works on every char in insert mode
vim.o.completeopt     = 'menuone,noselect'
vim.o.history         = 1000
vim.o.dictionary      = '/usr/share/dict/words'
vim.o.startofline     = true

-- Mapping waiting time
vim.o.timeout         = false
vim.o.ttimeout        = true
vim.o.ttimeoutlen     = 100

-- Display
vim.o.showmatch       = true -- show matching brackets
vim.o.scrolloff       = 3 -- always show 3 rows from edge of the screen
vim.o.synmaxcol       = 300 -- stop syntax highlight after x lines for performance
vim.o.laststatus      = 2 -- always show status line

vim.o.list            = false -- do not display white characters
vim.o.foldenable      = false
vim.o.foldlevel       = 4 -- limit folding to 4 levels
vim.o.foldmethod      = 'syntax' -- use language syntax to generate folds
vim.o.wrap            = true --do not wrap lines even if very long
vim.o.eol             = true -- show if there's no eol char
vim.o.showbreak       = '↪' -- character to show when line is broken

vim.opt.clipboard     = 'unnamedplus'

-- title string
vim.opt.title         = true
vim.opt.titlestring   = 'neovim'

-- Sidebar
vim.o.number          = true  -- line number on the left
vim.o.numberwidth     = 3     -- always reserve 3 spaces for line number
vim.o.signcolumn      = 'yes' -- keep 1 column for check
vim.o.modelines       = 0
vim.o.showcmd         = true  -- display command in bottom bar
-- make term better
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
-- do insert on enter term
-- vim.api.nvim_command('autocmd BufWinEnter,WinEnter term://* startinsert')


-- Search
vim.o.incsearch     = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase    = true -- ignore letter case when searching
vim.o.smartcase     = true -- case insentive unless capitals used in search

vim.o.matchtime     = 2    -- delay before showing matching paren
vim.o.mps           = vim.o.mps .. ",<:>"

-- White characters
vim.o.autoindent    = true
vim.o.smartindent   = true
vim.o.tabstop       = 2    -- 1 tab = 2 spaces
vim.o.shiftwidth    = 2    -- indentation rule
vim.o.formatoptions =
'qnj1'                     -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab     = true -- expand tab to spaces

-- Backup files
vim.o.backup        = true                         -- use backup files
vim.o.writebackup   = false
vim.o.swapfile      = false                        -- do not use swap file
vim.o.undodir       = HOME .. '/.vim/tmp/undo//'   -- undo files
vim.o.backupdir     = HOME .. '/.vim/tmp/backup//' -- backups
vim.o.directory     = '/.vim/tmp/swap//'           -- swap files

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

vim.cmd([[
" for debugging colorscheme
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! Synstack call SynStack()
]])
-- highlights the list of words following "Todo" if they are parsed in what looks like a comment
vim.cmd([[
autocmd Syntax * syntax keyword Todo note NOTE fixme FIXME todo TODO speed SPEED hack HACK safety SAFETY containedin=.*Comment.*
]])


vim.cmd([[
colorscheme yaks
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor
]])

if not vim.g.neovide then
  vim.cmd([[
  " ### Transparency ###
  hi Normal guibg=none ctermbg=none
  hi LineNr guibg=none ctermbg=none
  hi Folded guibg=none ctermbg=none
  hi NonText guibg=none ctermbg=none
  hi SpecialKey guibg=none ctermbg=none
  hi VertSplit guibg=none ctermbg=none
  hi SignColumn guibg=none ctermbg=none
  hi EndOfBuffer guibg=none ctermbg=none
  ]])
end
-- Commands mode
vim.o.wildmenu = true -- on TAB, complete options for system command
vim.o.wildignore =
'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- sometimes shift is held down for too long while zoomer quitting
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('QA', 'qa', {})


-- rust format on save
-- https://sharksforarms.dev/posts/neovim-rust/
local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  callback = function()
    print(vim.bo.filetype)
    -- idk what's happening but:
    --  https://github.com/sqls-server/sqls/issues/105
    if vim.bo.filetype == 'sql' then
      return
    end

    vim.lsp.buf.format({ timeout_ms = 200 })
  end,
  group = format_sync_grp,
})

-- clear whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
  group = format_sync_grp,
})
