" Basic configuration

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set termguicolors
set number relativenumber
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Plugins

call plug#begin('~/.vim/plugged')

	Plug 'preservim/nerdtree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/vim-cursorword'
    Plug 'luochen1990/rainbow'
    Plug 'davidhalter/jedi-vim'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

colorscheme catppuccin_mocha

" Mappings

let mapleader = " "
inoremap jj <ESC>
nnoremap o o<ESC>
nnoremap O O<ESC>
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <leader>py :w <CR>:!clear <CR>:!python3 % <CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>o :NERDTreeFocus<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

" VimScript

augroup filetype_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
augroup END

autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

augroup cursor_off
	autocmd!
	autocmd WinLeave * set nocursorline
	autocmd WinEnter * set cursorline
augroup END

" Oferece a opcao de utilizar relativenumber de forma interativa
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Formata arquivos Python utilizando o Black
augroup fmt
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
augroup END

" Verifica erros em aquivos Python com ruff e mostrar o resultado no quickfix
autocmd BufWritePost *.py silent! execute '!ruff check % > /data/data/com.termux/files/home/.ruff_errors/ruff_output' | cfile /data/data/com.termux/files/home/.ruff_errors/ruff_output | if len(getqflist()) > 0 | copen | endif

" Status Line

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
