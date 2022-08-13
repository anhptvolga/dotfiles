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

"vim-gist settings
let g:gist_post_private = 1
let g:gist_browser_command = 'sensible-browser %URL%'

"add new words (via zg) here
setlocal spellfile+=~/.vim/spell/en.utf-8.add
"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'
let g:ctrlp_user_command = 'fd --type f --hidden --exclude .git'

"nerdtree settings
" autocmd vimenter * NERDTree | wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets = "<c-s>"


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


let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let g:alchemist_tag_disable = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

 " coc-python settings
 let g:python_host_prog = '/usr/bin/python3'
 let g:python3_host_prog = '/usr/bin/python3'

 let g:snips_author='kpanic'
 let g:snips_email='anhptvolga@yandex.ru'
 let g:snips_github='https://github.com/anhptvolga'
 autocmd FileType python let b:coc_root_patterns = ['.git']

nnoremap <leader>ot :FloatermNew<CR>
nnoremap <leader>q :Bdelete<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:nayvy_coc_completion_icon='✡ nayvy'

let g:vimspector_enable_mappings = 'HUMAN'
