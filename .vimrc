" Basic configuration

set nocompatible
set hidden
filetype on
filetype plugin on
filetype indent on
syntax on
set laststatus=2
set signcolumn=yes
set updatetime=300
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
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Why not use it, I think it's lighter than Coc and don't have the minimal
    " version prerequisite issue
    Plug 'dense-analysis/ale'
    " UI Plugins
    Plug 'itchyny/lightline.vim'
    Plug 'maximbaz/lightline-ale'
    " HTML e CSS plugins
    Plug 'ap/vim-css-color'
    Plug 'alvan/vim-closetag'
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'mattn/emmet-vim'
    " Improve text editting and visualization
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/vim-cursorword'
    Plug 'luochen1990/rainbow'
    Plug 'tpope/vim-commentary'
    " Floaterminal integration
    Plug 'voldikss/vim-floaterm'
    Plug 'skywind3000/asyncrun.vim'
    " Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
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

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Rainbow parentheses
let g:rainbow_active = 1

" ALE configs
let g:ale_completion_enabled = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf', 'isort'],
            \ 'json': ['prettier'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ 'javascript': ['prettier', 'eslint'],
            \ }
let g:ale_linters = {
            \ 'python': ['pyright', 'ruff'],
            \ 'html': ['htmlhint'],
            \ 'css': ['csslint'],
            \ 'htmldjango': ['djlint'],
            \ 'javascript': ['tsserver', 'eslint'],
            \ }
let g:ale_set_ballons = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_fix_on_save = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_sign_info = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:lightline = {
            \ 'colorscheme': 'catppuccin_mocha',
            \ 'component_expand': {
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_infos': 'lightline#ale#infos',
            \   'linter_warning': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \ },
            \ 'component_type': {
            \   'linter_checking': 'right',
            \   'linter_infos': 'right',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'right',
            \ },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified' ],
            \             ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'] ]
            \ },
            \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" Mappings

let mapleader = " "
nnoremap ; :
inoremap <silent> jj <ESC> :w<CR>
nnoremap <silent> <leader>hl :nohlsearch<CR>
nnoremap o o<ESC>
nnoremap O O<ESC>
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <leader>py :AsyncRun -mode=term -pos=floaterm python3 % <CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTreeFocus<CR>
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

" A function to work with relativenumbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" ALEHover
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold * ALEHover
augroup END
