filetype off
filetype plugin indent on

" minpac
""" call minpac#add('repo', {'type', 'opt'})
""" call minpac#update()
""" call minpac#clean()
packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf') " fuzzy file finder

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

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
let python_highlight_all = 1

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

"you complete me settings
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

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

"make table-mode tables github-markdown compat
let g:table_mode_corner="|"
autocmd Filetype markdown TableModeEnable

"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'

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
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

