set background=dark
colorscheme wombat256

set nocompatible
set encoding=utf-8
set noswapfile
set noerrorbells

filetype plugin indent on

syntax enable
set term=xterm-256color
set t_Co=256

set number
set relativenumber
set ruler
set history=1000
set undolevels=1000
set showcmd

set nowrap
set linebreak
set expandtab
set shiftwidth=8
set tabstop=8
set softtabstop=8
set backspace=indent,eol,start
set smartindent
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set nolist

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set ttyfast
set cursorline

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

if has("autocmd")
        autocmd FileType make set noexpandtab
        autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
        autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
        autocmd FileType go set tabstop=8|set shiftwidth=8|set noexpandtab
        autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Load cscope databases in parent directories
function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
                let path = strpart(db, 0, match(db, "/cscope.out$"))
                set nocscopeverbose " suppress 'duplicate connection' error
                exe "cs add " . db . " " . path
                set cscopeverbose
        endif
endfunction
au BufEnter /* call LoadCscope()

let mapleader=","

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
