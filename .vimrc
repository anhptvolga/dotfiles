filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')

""" Tools

Plug 'moll/vim-bbye'
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'

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

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'elzr/vim-json'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mlaursen/vim-react-snippets'

" python
Plug 'relastle/vim-nayvy'

" Elixir
" Plug 'elixir-editors/vim-elixir'
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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

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
autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI=1

" replace
map <leader>fr :%s///g<left><left>
map <leader>frl :s///g<left><left>

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <f4> :NERDTreeFind<cr>
nnoremap <f5> :e %:h<cr>
nnoremap <c-f> :CtrlP<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

"ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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

" coc-python settings
let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'

let g:snips_author='kpanic'
let g:snips_email='anhptvolga@yandex.ru'
let g:snips_github='https://github.com/anhptvolga'
autocmd FileType python let b:coc_root_patterns = ['.git']

"
" copy tricks
"
vmap '' :w !xclip -i -sel clip<CR><CR>
vnoremap <C-c> "+y
vmap <C-y> :%y+<CR><CR>

"" thefullsnack
function! OpenFloatTerm()
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'row': row - 1,
    \ 'col': col - 2,
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'style': 'minimal'
    \ }
  let border_buf = nvim_create_buf(v:false, v:true)
  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }
  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  terminal
  startinsert
  " Hook up TermClose event to close both terminal and border windows
  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
endfunction

nnoremap <leader>ot :FloatermNew<CR>
nnoremap <Leader>q :Bdelete<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
let g:nayvy_coc_completion_icon='✡ nayvy'

source ~/.vim-coc
