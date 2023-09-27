" SETUP ------------------------------------------------------------ {{{
" Avoid problems disabling vi compatibility
set nocompatible

" Enable filetype detection for enable plugins and indentation
filetype on
filetype plugin on
filetype indent on

" Turn on syntax highlighting
syntax on

" Set the colorscheme to tokyonight
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Add number and relative number for navigation
set number relativenumber

" Higlight the cursorline underneath the cursor horizontally
set cursorline

" Configure shift width and tab width to 2 spaces, also use space instead
" of Tabs
set shiftwidth=2
set tabstop=2
set expandtab

" Don't save backups
set nobackup
set nowritebackup

" Low update time to improve user experience
set updatetime=300

" Show signcolumn
set signcolumn=yes

" Don't let cursor scroll below or above 10 line when scrolling
set scrolloff=10

" Don't wrap lines
set nowrap

" Search definitions
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase

" Show partial command you type in the last line
set showcmd

" Show the current mode in the last line
set showmode

" Enable autocompletion menu after pressing TAB and make it similar to
" Bash completion. Also ignore certain file types.
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" PLUGINS ----------------------------------------------------------- {{{

" VIM-PLUG ---------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

" File/folder navigation plugin
Plug 'preservim/nerdtree' | Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Undotree for best undo and redo control
Plug 'mbbill/undotree'

" Better syntax highlight
Plug 'sheerun/vim-polyglot'

" Autopairs for brackets and quotes
Plug 'jiangmiao/auto-pairs'

" FZF enable in Vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do':  './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" Underline the current word whenever it appears in the file
Plug 'itchyny/vim-cursorword'

" Rainbow brackets
Plug 'luochen1990/rainbow'

" Wakatime support for Vim
Plug 'wakatime/vim-wakatime'

" Airline plugin to have a good status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" Python plugins
Plug 'vim-scripts/indentpython.vim'
Plug 'sillybun/vim-repl'
Plug 'puremourning/vimspector'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-gist'
Plug 'airblade/vim-gitgutter'

" Web Development plugins
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Linters and formatters through the Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'honza/vim-snippets'

" Colorschemes and Airline themes
Plug 'elvessousa/sobrio'
Plug 'ghifarit53/tokyonight-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'jnurmine/Zenburn'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/vim-colors-pencil'

" Proper tmux.conf syntax highlight and integration with tmux
Plug 'tmux-plugins/vim-tmux'

" Database interaction and ui
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Floater terminal
Plug 'voldikss/vim-floaterm'

" Easy way to browse tags
Plug 'preservim/tagbar'

" ALE
Plug 'dense-analysis/ale'

" Which-key for beautiful keybindings management
Plug 'liuchengxu/vim-which-key'

call plug#end()

" }}}

" Airline and bufferline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'tokyonight'
let g:bufferline_echo = 0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Preview windown for fzf plugin
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

" Fix cursor hold delay
let g:cursorhold_updatetime = 100

" Rainbow parentheses
let g:rainbow_active = 1

" Coc Extensions
let g:coc_global_extensions = [
                  \ 'coc-json',
                  \ 'coc-yank',
                  \ 'coc-tailwindcss',
                  \ 'coc-snippets',
                  \ 'coc-prettier',
                  \ 'coc-html-css-support',
                  \ 'coc-html',
                  \ 'coc-fzf-preview',
                  \ 'coc-eslint',
                  \ 'coc-emmet',
                  \ 'coc-vimlsp',
                  \ 'coc-tsserver',
                  \ 'coc-stylelint',
                  \ 'coc-lua',
                  \ 'coc-htmlhint',
                  \ 'coc-htmldjango',
                  \ 'coc-css',
                  \ 'coc-angular',
                  \ '@yaegassy/coc-pylsp'
                  \ ]

" Quickfix through ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" REPL configuration
let g:sendtorepl_invoke_key = "<leader>ps"
let g:repl_position = 3
let g:repl_stayatrepl_when_open = 0
let g:repl_ipython_version = '8.15'
let g:repl_program = {
			\	'python': 'ipython',
			\	'default': 'zsh',
      \ 'r': 'R',
      \ 'lua': 'lua',
      \ 'vim': 'vim -e',
			\	}
let g:repl_predefine_python = {
      \ 'numpy': 'import numpy as np',
      \ 'matplotlib': 'from matplotlib import pyplot as plt'
      \ }
let g:repl_exit_commands = {
			\	'ipython': 'quit()',
      \ 'python': 'quit()',
			\	'bash': 'exit',
			\	'zsh': 'exit',
			\	'default': 'exit',
			\	}
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ', 'with ', 'async def', '@', 'try']

" }}}

" MAPPINGS ---------------------------------------------------------- {{{

" Set space as the leader key
let mapleader = " "
let maplocalleader = ","

" WHICH-KEY --------------------------------------------------------- {{{

" By default timeout is 1000 ms
set timeoutlen=500

" which-key minimal configuration
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map =  {}

" Mappings for fzf commands
let g:which_key_map.f = {
                  \ 'name': 'FZF'   ,
                  \ 'f' : ['Files'   , 'Find Files']   ,
                  \ 'b' : ['Buffers' , 'Find Buffers'] ,
                  \ 'c' : ['Colors'  , 'Find Colors']  ,
                  \ 'C' : ['Commands', 'Find Commands'],
                  \ }
nnoremap <silent> <leader>fd :CocFzfList diagnostics --current-buf<CR>
let g:which_key_map.f.d = 'Find Diagnostics'
nnoremap <silent> <leader>fy :CocFzfList yank<CR>
let g:which_key_map.f.y = 'Find Yank'

" Mappings for buffers commands
let g:which_key_map.b = {
      \ 'name' : 'Buffer' ,
      \ 'd' : ['bd'        , 'Delete Buffer']   ,
      \ 'f' : ['bfirst'    , 'First Buffer']    ,
      \ 'l' : ['blast'     , 'Last Buffer']     ,
      \ 'n' : ['bnext'     , 'Next Buffer']     ,
      \ 'p' : ['bprevious' , 'Previous Buffer'] ,
      \ '?' : ['Buffers'   , 'FZF Buffers']     ,
      \ }

" Mappings for terminal commands
let g:which_key_map.t = {
                  \ 'name': 'Terminal',
                  \ 'f' : {
                        \ 'name': 'Floaterm',
                        \ 'N' : ['FloatermNew', 'New'],
                        \ 't' : ['FloatermToggle', 'Toggle'],
                        \ 'n' : ['FloatermNext', 'Next'],
                        \ 'p' : ['FloatermPrev', 'Previous'],
                        \ },
                  \ }
nnoremap <silent> <leader>tfl :FloatermNew lazygit<CR>
let g:which_key_map.t.f.l = 'LazyGit'
nnoremap <silent> <leader>tv :vertical terminal<CR> <C-h>
let g:which_key_map.t.v = 'Vertical'
nnoremap <silent> <leader>th :bel term ++rows=8<CR> <C-j>
let g:which_key_map.t.h = 'Horizontal'

" Mappings for NERDTree commands
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
let g:which_key_map.e = { 'name' : 'NERDTree Toggle' }
nnoremap <silent> <leader>o :NERDTreeFocus<CR>
let g:which_key_map.o = { 'name' : 'NERDTree Focus' }

" Mappings for CoCList commands
let g:which_key_map.c = { 'name' : 'Coc Actions' }
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
" Symbol renaming
nmap <leader>crn <Plug>(coc-rename)
" Formatting selected code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
" Remap keys for applying code actions at the cursor position
nmap <leader>cac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>cas  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cqf  <Plug>(coc-fix-current)
" Remap keys for applying refactor code actions
nmap <silent> <leader>cre <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
" Run the Code Lens action on the current line
nmap <leader>ccl  <Plug>(coc-codelens-action)

" Mappings for Spellcheck commands
let g:which_key_map.s = { 'name' : 'Spellcheck' }
nnoremap <silent> <leader>sy :set spell<CR>
let g:which_key_map.s.y = 'Turn on Spellcheck'
nnoremap <silent> <leader>sn :set nospell<CR>
let g:which_key_map.s.n = 'Turn off Spellcheck'

" Mappings for GitGutter commands
let g:which_key_map.h = { 'name' : 'GitGutter' }

" Mappings for VimSpector commands
let g:which_key_map.d = { 'name' : 'Debug' }
" for normal mode - the word under the cursor
nmap <leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <leader>di <Plug>VimspectorBalloonEval
" When debugging, continue. Otherwise start debugging.
nnoremap <leader>dc <Plug>VimspectorContinue
"	Stop debugging.
nnoremap <leader>ds <Plug>VimspectorStop
"	Restart debugging with the same configuration.
nnoremap <leader>dr <Plug>VimspectorRestart
" Pause debbuggae.
nnoremap <leader>dp <Plug>VimspectorPause
"	Toggle line breakpoint on the current line.
nnoremap <leader>dtp <Plug>VimspectorToggleBreakpoint
"	Toggle conditional line breakpoint or logpoint on the current line.
nnoremap <leader>dtb 	<Plug>VimspectorToggleConditionalBreakpoint
" Add a function breakpoint for the expression under cursor
nnoremap <leader>dta <Plug>VimspectorAddFunctionBreakpoint
"	Run to Cursor
nnoremap <leader>dtr 	<Plug>VimspectorRunToCursor
" Step Over
nnoremap <leader>dso <Plug>VimspectorStepOver
" Step Into
nnoremap <leader>dsi <Plug>VimspectorStepInto
" Step out of current function scope
nnoremap <leader>dsO <Plug>VimspectorStepOut

" Mappings for Python Tools Commands
let g:which_key_map.p = {
                  \ 'name': 'Python',
                  \ 'r' : ['REPLToggle', 'Toggle Python REPL'],
                  \ }
let g:which_key_map.p.s = 'Send to REPL'

" Mappings for Query (through dadbod-ui) Commands
let g:which_key_map.q = {
                  \ 'name': 'Query',
                  \ 'a' : ['DBUIAddConnection', 'Add a connection'],
                  \ 'd' : ['DBUI', 'Open drawer'],
                  \ 't' : ['DBUIToggle', 'Toggle DBUI'],
                  \ 'b' : ['DBUIFindBuffer', 'Find Buffer'],
                  \ }

" }}}

" Press jj to exit insert mode quickly ans save the file
inoremap jj <ESC>:w<CR>

" Pressing the letter o will open a new line below the current one.
" exit insert mode after creating a new line above or below the current
nnoremap o o<ESC>
nnoremap O O<ESC>

" Center the cursor vertically when moving to the next word during
" search
nnoremap n nzz
nnoremap N Nzz

" Yank from the cursor to the end of line
nnoremap Y y$

" Use J and K to reposition a piece of text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" You can split the window by typing :split or :vsplit
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h or
" CTRL+l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Disabling arrow keys in normal and insert mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>

" Map the <F5> to toggle tagbar
nnoremap <F5> :TagbarToggle<CR>

" Map the <F9> to toggle the undo-tree
nnoremap <F9> :UndotreeToggle<CR>

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" }}}

" VIMSCRIPT --------------------------------------------------------- {{{

" Enable folding in vim files
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" :Prettier now uses coc-prettier to format the buffer
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Sets the tabstop and shiftwidth to 4 only for python files
augroup python_indent
  autocmd!
  autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
augroup END

" Indent guide
function! SetCustomListChars()
  let l:sw = &sw
  let l:listchars = 'trail:·,tab:│\ ,multispace:┆' . repeat('\ ', l:sw - 1)
  execute 'setlocal listchars=' . l:listchars
endfunction

autocmd BufWinEnter * call SetCustomListChars()
set list

" }}}
