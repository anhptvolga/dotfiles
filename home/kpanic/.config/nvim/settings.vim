filetype off
filetype plugin indent on

set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
" set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
" set cmdheight=2                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set laststatus=2                        " Always display the status line
set number                              " Line numbers
" set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
"set updatetime=300                      " Faster completion
"set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else

" New stuff
" set notimeout nottimeout
" set scrolloff=1
" set sidescroll=1
" set sidescrolloff=1
" set display+=lastline
" set nostartofline
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set mmp=1300
" set autochdir                           " Your working directory will always be the same as your working directory
" set foldcolumn=2                        " Folding abilities

" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set backspace=indent,eol,start		 " allow backspacing over everything in insert mode
set history=1000
set showcmd   				 " show incomplete cmds down the bottom
set showmode   				 " show current mode down the bottom
set list 				 " display tabs and trailing spaces
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch   			 " find the next match as we type the search
set hlsearch    			 " hilight searches by default
set linebreak   			 " wrap lines at convenient points

"default indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" folding settings
set foldmethod=indent   		" fold based on indent
set foldnestmax=33     		 	" deepest fold is 3 levels
set nofoldenable        	 	" dont fold by default

set wildmenu                		" enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=full
" set wildmode=list:longest   		" make cmdline tab completion similar to bash
set wildignore=*.o,*.obj,*~ 		" stuff to ignore when tab completing

set formatoptions-=o 			" dont continue comments when pushing o/O

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" some stuff to get the mouse going in term
set mouse=a
if !has("nvim")
    set ttymouse=xterm2
endif

set ignorecase
set smartcase

runtime! projects/**/*.vim 		" source project specific config files

autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif

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
  endif
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
