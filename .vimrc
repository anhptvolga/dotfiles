filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')

""" Tools

Plug 'godlygeek/tabular'                                                          " Text filtering and alignment
Plug 'yegappan/mru'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', {'on':['NERDTreeToggle', 'NERDTreeInit', 'NERDTree']} " File manager
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'                                                           " Helpers for UNIX
Plug 'romainl/vim-cool'                                                           " Search highlight more useful.
Plug 'junegunn/vim-peekaboo'                                                      " Peek content of the registers

""" Code

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

Plug 'honza/vim-snippets'

Plug 'elzr/vim-json'

" Elixir
Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" Plug 'c-brenn/phoenix.vim'
" Plug 'tpope/vim-projectionist'

""" Themes

Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()


"set encoding
set encoding=utf-8

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set number      "show line numbers

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=33       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=full
" set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

syntax on


"some stuff to get the mouse going in term
set mouse=a
if !has("nvim")
    set ttymouse=xterm2
endif

"hide buffers when not displayed
set hidden

"set system clipboard
set clipboard=unnamed

set ignorecase
set smartcase


colorscheme onehalflight
" let g:airline_theme='onehalfdark'
" let g:lightline.colorscheme='onehalfdark'
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }

" pear-tree
"

" let g:pear_tree_ft_disabled = []
" " Pair expansion is dot-repeatable by default:
" let g:pear_tree_repeatable_expand = 0
" " Smart pairs are disabled by default:
" let g:pear_tree_smart_openers = 1
" let g:pear_tree_smart_closers = 1
" let g:pear_tree_smart_backspace = 1
" " If enabled, smart pair functions timeout after 60ms:
" " let g:pear_tree_timeout = 60
" " Automatically map <BS>, <CR>, and <Esc>
" let g:pear_tree_map_special_keys = 0
" " Default mappings:
" imap <BS> <Plug>(PearTreeBackspace)
" imap <CR> <Plug>(PearTreeExpand)
" " imap <Esc> <Plug>(PearTreeFinishExpansion)
" " Pear Tree also makes <Plug> mappings for each opening and closing string.
" "     :help <Plug>(PearTreeOpener)
" "     :help <Plug>(PearTreeCloser)
" " Not mapped by default:
" " <Plug>(PearTreeSpace)
" " <Plug>(PearTreeJump)
" " <Plug>(PearTreeExpandOne)
" " <Plug>(PearTreeJNR)


"plantuml conf
let g:plantuml_executable_script = "$HOME/.vim/plantuml/uml.sh"

"make wrapped lines more intuitive
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

"vim-gist settings
let g:gist_post_private = 1
let g:gist_browser_command = 'sensible-browser %URL%'

"add new words (via zg) here
setlocal spellfile+=~/.vim/spell/en.utf-8.add
"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'
let g:ctrlp_user_command = 'fd --type f --hidden --exclude .git'

"nerdtree settings
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI=1

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <f4> :NERDTreeFind<cr>
nnoremap <f5> :e %:h<cr>
nnoremap <c-f> :CtrlP<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

"ultisnips settings
let g:UltiSnipsListSnippets = "<c-s>"

"source project specific config files
runtime! projects/**/*.vim

"tmux-vim-navigator setup
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-w> :TmuxNavigatePrevious<cr>

" latex
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
" filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"
" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


vmap '' :w !pbcopy<CR><CR>

autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let g:alchemist_tag_disable = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']


" Status line
" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
    let l:m = mode()
  if (m =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (m =~# '\v(v|V)' || m ==# '\<C-V>' || m ==# 'Terminal')
    exe 'hi! StatusLine ctermfg=005'
  elseif (m ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif
  return ''
endfunction
" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{mode()}   " Current mode
set statusline+=%0*\ [%n]                                " buffernr
set statusline+=%0*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%0*\ %=                                  " Space
set statusline+=%0*\ %y\                                 " FileType
set statusline+=%0*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%0*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (

source ~/.vim-coc
