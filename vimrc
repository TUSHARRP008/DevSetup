" ==========================================
"   Tushar’s Ultimate Vimrc
" ==========================================

" --- Plugin System ---
call plug#begin('~/.vim/plugged')

" Syntax enhancement for C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Auto-close brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Commenting shortcuts: gcc, gc
Plug 'tpope/vim-commentary'

call plug#end()

" --- General Editor Settings ---
set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on
set fileformat=unix

" --- UI / Navigation ---
set number                  " Show absolute line numbers
set relativenumber          " Show relative numbers for motion
set cursorline              " Highlight the current line
set showmatch               " Highlight matching brackets
set ruler                   " Show line and column number
set showcmd                 " Display incomplete commands
set laststatus=2            " Always show status line
set wildmenu                " Better command-line completion
set background=dark

" --- Search Behavior ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" --- Indentation ---
set autoindent
set smartindent             " Smart C/C++ indentation
set expandtab               " Convert tabs to spaces
set shiftwidth=4            " Indent width
set tabstop=4               " Visual width of tab
set smarttab                " Use shiftwidth when pressing tab
set cinoptions=t0

" Filetype-specific indentation for Makefiles
augroup filetypedetect
    autocmd!
    autocmd FileType make set noexpandtab shiftwidth=8
augroup END

" --- Clipboard & Undo ---
set clipboard=unnamedplus   " Share clipboard with system (copy/paste)
set undofile
set undodir=~/.vim/undo     " Persistent undo history

" --- Folding (Code Collapsing) ---
set foldmethod=syntax       " Fold based on code indentation
set foldlevel=99            " Keep folds open by default

" --- C++ Compile & Debug Shortcuts ---
" F8 → Compile & Run
nnoremap <F8> :w<CR>:!clear; g++ % -Wall -std=c++17 -o %:r && ./%:r<CR>

" F9 → Compile & Debug with gdb
nnoremap <F9> :w<CR>:!clear; g++ % -g -std=c++17 -o %:r && gdb ./%:r<CR>

" --- Tags and Cscope Integration (Index Engines setup) ---
set tags+=/opt/source/indexengines/ie/tags

if has("cscope")
    set cscopeverbose
    if filereadable("/opt/source/indexengines/ie/cscope.out")
        silent! cs add /opt/source/indexengines/ie/cscope.out
    endif
endif

" Cscope Key Mappings
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" --- Highlight trailing whitespace ---
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
