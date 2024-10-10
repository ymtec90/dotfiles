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
set omnifunc=ale#completion#OmniFunc
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Plugins

call plug#begin('~/.vim/plugged')

    " Better files navigation
    Plug 'preservim/nerdtree'
    " HTML e CSS plugins
    Plug 'ap/vim-css-color'
    Plug 'alvan/vim-closetag'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'mattn/emmet-vim'
    " Improve text editting and visualization
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/vim-cursorword'
    Plug 'luochen1990/rainbow'
    " Git integration
    Plug 'airblade/vim-gitgutter'
    " Why not use it, I think it's lighter than Coc and don't have the minimal
    " version prerequisite issue
    Plug 'dense-analysis/ale'
    " Tmux integration
    Plug 'christoomey/vim-tmux-navigator'
    " Colorschemes
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" Setting Catppuccin as colorscheme
colorscheme catppuccin_mocha

" Remapping emmet's plugin leader-key
let g:user_emmet_leader_key='<leader>,'
let g:user_emmet_mode='n'

" ALE configs
let g:ale_completion_enabled = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black'],
            \ 'json': ['prettier'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ }
let g:ale_linters = {
            \ 'python': ['ruff', 'jedils'],
            \ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

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
nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<CR>

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

" Status Line

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
