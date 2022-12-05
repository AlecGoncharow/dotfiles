set nocompatible              " be iMproved, required

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" rust lang
Plug 'rust-lang/rust.vim'
" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"C++ Highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'

Plug 'psliwka/vim-smoothie'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'edkolev/tmuxline.vim'

" make searching less annoying
Plug 'romainl/vim-cool'

" inline sudo reading/writing
Plug 'lambdalisue/suda.vim'


call plug#end()

filetype plugin indent on    " required

colorscheme gruvbox

hi clear SignColumn

set textwidth=80

let mapleader = " " " map leader to Space

set clipboard+=unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


map <C-h> :set hlsearch!<CR>

nnoremap <C-l> :ls<CR>:b<space>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

noremap <leader>w :call TrimWhitespace()<CR>

set hlsearch
set incsearch

set mouse=a

" regex by default
set magic
set smarttab

let g:enable_bold_font = 1


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *.go,*.html,*py,*pyw,*.c,*.h,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.go,*.html,*.py,*.pyw,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set shiftwidth=4
"au BufRead,BufNewFile *.go,*.html,*.py,*.pyw,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set expandtab
"au BufRead,BufNewFile *.go,*.html,*.py,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set softtabstop=4

au BufRead,BufNewFile * set tabstop=4
au BufRead,BufNewFile * set shiftwidth=4
au BufRead,BufNewFile * set expandtab
au BufRead,BufNewFile * set softtabstop=4

au BufRead,BufNewFile *.yaml set tabstop=2
au BufRead,BufNewFile *.yaml set shiftwidth=2
au BufRead,BufNewFile *.yaml set softtabstop=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *.css set tabstop=2

"spaces for indents
au BufRead,BufNewFile *.css set shiftwidth=2
au BufRead,BufNewFile *.css set expandtab
au BufRead,BufNewFile *.css set softtabstop=2

au BufRead,BufNewFile *.tex set syntax=context
set ai "auto indent
set si "smart indent

set nu

highlight LineNr ctermfg=grey

syntax on

set backspace=indent,eol,start

" Rust
let g:rustfmt_autosave = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:smoothie_experimental_mappings = 1

let g:airline_theme='base16_gruvbox_dark_hard'

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_code_completion_enabled = 0
let g:godef_split = 0
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'

let g:python3_host_prog = '/usr/bin/python3'

" coc config under ./plugin/coc.vim
