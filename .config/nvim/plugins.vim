call plug#begin('~/.vim/plugged')

""" Tools
Plug 'moll/vim-bbye'
Plug 'godlygeek/tabular'                                                          " Text filtering and alignment
Plug 'yegappan/mru'
Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/nerdtree', {'on':['NERDTreeToggle', 'NERDTreeInit', 'NERDTree']} " File manager
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'                                                           " Helpers for UNIX
Plug 'romainl/vim-cool'                                                           " Search highlight more useful.
Plug 'junegunn/vim-peekaboo'                                                      " Peek content of the registers
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/goyo.vim'

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

" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'elzr/vim-json'

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

Plug 'puremourning/vimspector'

""" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()
