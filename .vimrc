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
    Plug 'ryanoasis/vim-devicons'
    " FZF integration
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Ctags exploration
    Plug 'preservim/tagbar'
    " Improve text editting and visualization
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
    " Linters and formatters through the Conquer of Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'honza/vim-snippets'
    " Tmux integration
    Plug 'christoomey/vim-tmux-navigator'
    " Annotation and planner
    Plug 'vimwiki/vimwiki'
    Plug 'mattn/calendar-vim'
    " Colorschemes
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" Setting Catppuccin as colorscheme
colorscheme catppuccin_mocha

" Preview windown for fzf plugin
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

" Fix cursor hold delay
let g:cursorhold_updatetime = 100

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Rainbow parentheses
let g:rainbow_active = 1

" Vimwiki list symbols
let g:vimwiki_listsyms = '✗○◐●✓'

" Coc Extensions
let g:coc_global_extensions = [
                  \ 'coc-css',
                  \ 'coc-emmet',
                  \ 'coc-fzf-preview',
                  \ 'coc-html',
                  \ 'coc-html-css-support',
                  \ 'coc-htmldjango',
                  \ 'coc-json',
                  \ 'coc-lightbulb',
                  \ 'coc-prettier',
                  \ 'coc-pyright',
                  \ 'coc-snippets',
                  \ 'coc-toml',
                  \ 'coc-vimlsp',
                  \ 'coc-yank',
                  \ ]

" Mappings

let mapleader = " "
nnoremap <leader>q :q<CR>
inoremap jj <ESC>
nnoremap o o<ESC>
nnoremap O O<ESC>
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
nnoremap <silent> <leader>hl :nohlsearch<CR>
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
nnoremap <silent> <leader>t <Plug>VimwikiToggleListItem<CR>
nnoremap <silent> <leader>, :TagbarToggle<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>fh :History:<CR>
nnoremap <silent> <leader>fs :History/<CR>

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

" Offers the option of using relativenumbers in an interactive way
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Uses isort when writing a python file 
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

" Status Line

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
" Add Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" Coc.nvim configuration

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

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

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>
