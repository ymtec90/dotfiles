" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add hybrid numbers to each line on the left-hand side.
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
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

" Set the background tone.
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
  Plug 'instant-markdown/vim-instant-markdown', { 'for': 'markdown', 'do': 'yarn install' }
" Bufferline plugin
  Plug 'bling/vim-bufferline'
" Airline plugin for manage Vim status line
  Plug 'vim-airline/vim-airline'
" Airline themes
  Plug 'vim-airline/vim-airline-themes'
" Provides support for expanding abbreviations
  Plug 'mattn/emmet-vim'
" Prettier plugin for Vim
  Plug 'prettier/vim-prettier'
" Vim CSS Colors - highlight the css colors values
  Plug 'ap/vim-css-color'
" Update Vim's built-in css to support CSS3
  Plug 'hail2u/vim-css3-syntax'
" JavaScript highlighting and improved indentation
  Plug 'pangloss/vim-javascript'
" VimWiki a personal wiki for Vim
  Plug 'vimwiki/vimwiki'
" Calendar-vim for integrate with VimWiki
  Plug 'https://github.com/mattn/calendar-vim'
" Vim-Closetag plugin for closing html tags
  Plug 'alvan/vim-closetag'
" Vim tagalong for matching the changes in the html tags
  Plug 'AndrewRadev/tagalong.vim'
" Vim-jsx-pretty for React Support
  Plug 'maxmellon/vim-jsx-pretty'
" React Snippets
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'
" Tern_for_VIM for Angular support
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Bracey plugin for live html, css and javascript editing in Vim
  Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

call plug#end()

" See the docstrings for folded code by SimpylFold
let g:SimpylFold_docstring_preview = 1

" Enable ALE fixers
let g:ale_javascript_eslint_use_global = 1
let g:jsx_ext_required = 0
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': [
\   'black',
\   'yapf'
\   ],
\ 'html': ['prettier'],
\ 'css': ['prettier'],
\ 'javascript': [
\   'eslint',
\   'prettier'
\   ],
\ 'javascript.jsx': [
\   'eslint',
\   'prettier'
\   ],
\ 'typescript': [
\   'eslint',
\   'prettier'
\   ],
\ 'typescriptreact': [
\   'eslint',
\   'prettier'
\   ],
\ 'json': ['prettier'],
\}

" Enable ALE linters
let g:ale_linters = {
\ 'html': ['htmlhint'],
\ 'css': ['prettier'],
\ 'javascript': ['standard'],
\}
let g:ale_sign_columns_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" ALE configs for JavaScript Prettier
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none'

" Enable completion where available.
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

" Configuring the vim-bufferline
let g:bufferline_echo = 0

" Configuration of the tab line
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_set = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Setting the emmet-vim leader key
let g:user_emmet_leader_key = ','

" Set the vimwiki path
let g:vimwiki_list = [{'path':'~/Documentos/vimwiki/'}]

" Set the sequence of icons for the to do list in vimwiki
let g:vimwiki_listsyms='✗○◐●✓'

" Small configuration for Calendar diary
let g:calendar_diary_list=[
      \ {'name':'diary',
      \ 'path':$HOME.'/Documentos/vimwiki/diary',
      \ 'ext':'.wiki'}
      \ ]

" }}}


" MAPPINGS --------------------------------------------------------------{{{

" Mappings code goes here.

" Type jj or jk to exit insert mode quickly.
inoremap jj <esc>
inoremap jk <esc>

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

" Map the <F6> key to run a HTML file inside the browser
nnoremap <F6> :w <CR>:!clear <CR>:!xdg-open %<CR>

" Map the <F7> key to run a JavaScript file inside Vim.
nnoremap <F7> :w <CR>:!clear <CR>:!/usr/bin/node %<CR>

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

" Map the TAB key to move to the next buffer
nnoremap [b :bn<CR>

" Map the combination Shift-TAB to move to previous buffer
nnoremap ]b :bp<CR>

" Map the <F8> to toggle the calendar-tree
nnoremap <F8> :Calendar<CR>

" Manage sessions easily
" To make a session
nnoremap <leader>ms :mks!<CR>
" To restore the last session
nnoremap <leader>rs :so Session.vim<CR>

" Easily left Vim
nnoremap <leader>q :q!<CR>

" Enabling and disabling spellcheck
" Enable
nnoremap <leader>sy :set spell<CR>
" Disable
nnoremap <leader>sn :set nospell<CR>

" Mapping for error handling with ALE
nnoremap <leader>af :ALEFix<CR>
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Bracey mappings for live editing
" To start Bracey
nnoremap <F9> :Bracey<CR>
" To stop Bracey
nnoremap <F12> :BraceyStop<CR>

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

" Automatic update the vimwiki diary index
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
  autocmd!
  " automatically update links on read diary
  autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

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
