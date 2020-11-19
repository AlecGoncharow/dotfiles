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
" syntastic
Plug 'vim-syntastic/syntastic'
"C++ Highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
"GLSL
Plug 'tikhomirov/vim-glsl'
" latex
Plug 'lervag/vimtex'

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

hi clear SignColumn

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

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
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF




" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

set laststatus=2
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

map <C-h> :set hlsearch!<CR>

"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>

nnoremap <C-l> :ls<CR>:b<space>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

noremap <C-w> :call TrimWhitespace()<CR>

set hlsearch
set incsearch

set mouse=a

" regex by default
set magic
set smarttab

let g:enable_bold_font = 1

" Statusline {{{2

" Statusline definition {{{3
set statusline= 				" clear
set statusline+=%1*\                            " Color -
set statusline+=%t                              " Tail of the filename
set statusline+=%2*                             " Color
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%3*                             " Color
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=%4*\                            " Color -
" set statusline+=%{g:pluginUpdateStatus}         " Up to date plugins
set statusline+=\ \                             " --
set statusline+=%{&filetype}                    " Filetype
set statusline+=\ \                             " --
set statusline+=%{&fenc}                        " File encoding
set statusline+=[%{&ff}]                        " File format
set statusline+=[                               " Indent settings: begin
set statusline+=%{&expandtab?\"sp\":\"tab\"}\   " Indent settings
set statusline+=%{&shiftwidth}                  " Indent settings
set statusline+=]                               " Indent settings: end
set statusline+=\ %5*\ \ \                      " - Color ---
set statusline+=%2c                             " Cursor column
set statusline+=\ \                             " --
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines
" set statusline+=\ \                             " --
" set statusline+=%P                              " Percent through file

" Statusline colors {{{3
hi User1 ctermfg=250 ctermbg=234
hi User2 ctermfg=008 ctermbg=234
hi User3 ctermfg=143 ctermbg=234
hi User4 ctermfg=237 ctermbg=233
hi User5 ctermfg=238 ctermbg=233




"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *.html,*py,*pyw,*.c,*.h,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.html,*.py,*.pyw,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set shiftwidth=4
au BufRead,BufNewFile *.html,*.py,*.pyw,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set expandtab
au BufRead,BufNewFile *.html,*.py,*.js,*.tex,*.glsl,*.java,*.ts,*.tsx,*.c,*.cpp,*.h,*.hpp set softtabstop=4

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

let python_highlight_all=1
syntax on
highlight Pmenu ctermfg=cyan ctermbg=black

let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set backspace=indent,eol,start

" Rust
let g:rustfmt_autosave = 1
"let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'
"let g:racer_experimental_completer = 1
"let g:ycm_racerd_binary_path = '~/.cargo/bin/racer'
nnoremap <C-]> :YcmCompleter GoTo<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <C-e> :SyntasticReset<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tex_flavor='latex'
