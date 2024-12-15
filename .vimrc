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
" Completion and snippets support
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'andreypopp/asyncomplete-ale.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-emmet.vim'
if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif
" HTML e CSS plugins
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'
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
" FZF plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Colorschemes
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" Setting Catppuccin as colorscheme
colorscheme catppuccin_mocha

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Rainbow parentheses
let g:rainbow_active = 1

" Asyncomplete config
if has('python3')
    let g:UltiSnipsExpandTrigger="<CR>"
endif

" ALE configs
let g:ale_completion_enabled = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf', 'isort', 'black', 'autoflake'],
            \ 'json': ['prettier'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ 'javascript': ['prettier', 'eslint'],
            \ 'rust': ['rustfmt'],
            \ }
let g:ale_linters = {
            \ 'python': ['pyright', 'flake8'],
            \ 'html': ['htmlhint'],
            \ 'css': ['csslint'],
            \ 'javascript': ['tsserver', 'eslint'],
            \ 'rust': ['analyzer'],
            \ 'vim': ['ale_custom_linting_rules', 'vimls'],
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
nnoremap <leader>rs :AsyncRun -mode=term -pos=floaterm cargo run <CR>
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
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fc :Colors<CR>
nnoremap <silent> <leader>fm :Maps<CR>
nnoremap <silent> <leader>fs :Snippets<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"


" VimScript

augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END

autocmd Filetype css,html,javascript,typescript setlocal tabstop=2 shiftwidth=2 expandtab

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

" Asyncomplete registration
au User asyncomplete_setup call asyncomplete#ale#register_source({
            \ 'name': 'reason',
            \ 'linter': 'flow',
            \ })

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
            \ 'name': 'emoji',
            \ 'allowlist': ['*'],
            \ 'completor': function('asyncomplete#sources#emoji#completor'),
            \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'allowlist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'allowlist': ['*'],
            \ 'blocklist': ['go'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \    'max_buffer_size': 5000000,
            \  },
            \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
            \ 'name': 'emmet',
            \ 'whitelist': ['html'],
            \ 'completor': function('asyncomplete#sources#emmet#completor'),
            \ }))

if has('python3')
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'allowlist': ['*'],
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif
