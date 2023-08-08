" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add hybrid numbers to each line on the left-hand side.
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space caracters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as
" you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set commands to save in history default number is 20.
set history=1000

" Set the backgroud tone.
"set background=dark
    
" Set the color scheme.
colorscheme zenburn

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jgp,*.png,*.gif,*.pdf,*.pyc,*.exe,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------{{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

" Asynchronous Lint Engine
  Plug 'dense-analysis/ale', { 'do': 'pip install flake8 isort yapf black' }
" A tree explorer
  Plug 'preservim/nerdtree' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
" Python code folding for Vim
  Plug 'tmhedberg/SimpylFold'
" An alternative indentation script for python
  Plug 'vim-scripts/indentpython.vim'
" Syntax highlighting
  Plug 'sheerun/vim-polyglot'
" Async completion framework made ease
  Plug 'maralla/completor.vim', { 'do': 'pip install jedi' }
" Use the jedi autocompletion library
  Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
" Search files and buffers
  Plug 'ctrlpvim/ctrlp.vim'
" Instant Markdown previews
  Plug 'instant-markdown/vim-instant-markdown', { 'for': 'markdown', 'do': 'yarn install'}
" Calendar vimscript
  Plug 'https://github.com/mattn/calendar-vim'
" Airline plugin for manage Vim status line
  Plug 'vim-airline/vim-airline'
" Airline themes
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

" See the docstrings for folded code by SimpylFold
let g:SimpylFold_docstring_preview=1

" Enable ALE fixers
let g:ale_fixers = {
\ 'python': [
\   'black',
\   'yapf',
\   'remove_trailing_lines',
\   'trim_whitespace'
\    ]
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1


" Enable completion where avaliable.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enable = 1

" Avoid conflict between completor and jedi-vim
let g:jedi#completions_enabled = 0

" Set vim-airline to use vim-devicons
let g:airline_powerline_fonts = 1

" Selecting the status line theme
let g:airline_theme='base16'


" }}}


" MAPPINGS --------------------------------------------------------------{{{

" Mappings code goes here.

" Type jj to exit insert mode quickly.
inoremap jj <esc>

" Set the backslash as the leader key. 
let mapleader = ","

" Press ,, to turn off search highlighting
nnoremap <leader>, :nohlsearch<CR>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during search. 
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h or CTRL+l.
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT or CTRL+RIGHT.
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<CR>

" Have NERDTree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Enable autopair for brackets
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" Map the F9 key to start the Calendar plugin
nnoremap <F9> :Calendar<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------{{{

" VIMSCRIPT goes here 

" This will enable code folding
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursor column ONLY in active window.
"augroup cursor_off
"   autocmd!
"   autocmd WinLeave * set nocursorline nocursorcolumn
"   autocmd WinEnter * set cursorline cursorcolumn
"augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')
    
    " Set the backgroud tone.
    set background=dark
    
    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=DroidSansMono\ Nerd\ Font\ 11

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the left-side scroll bar.
    set guioptions-=L

    " Hide the right-side scroll bar.
    set guioptions-=r

    " Hide the menu bar.
    set guioptions-=m

    " Hide the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar and scrollbar.
    " <Bar> is the pip character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guiptions-=mTr<Bar>
        \else<Bar>
        \endif<CR>

endif

" Adding UTF-8 Support
set encoding=utf8

" Automatic toggle between line numbers mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" }}}


" STATUS LINE -----------------------------------------------------------{{{

" Status bar code goes here.

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"}}}
