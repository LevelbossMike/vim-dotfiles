""""""""""""""""""""""""
" dein plugin manager "
""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

"""""""""""
" Plugins "
"""""""""""
" manage plugins
call dein#add('Shougo/dein.vim')
" utility commands for dein
call dein#add('haya14busa/dein-command.vim')

" zoom into a buffer
call dein#add('vim-scripts/zoomwintab.vim')
call dein#add('ervandew/supertab')
" easy comments
call dein#add('scrooloose/nerdcommenter')
" filetree
call dein#add('scrooloose/nerdtree')
" fuzzy file search
call dein#add('ctrlpvim/ctrlp.vim')
" intent-guides
call dein#add('nathanaelkane/vim-indent-guides')
" heasy markdown
call dein#add('hallison/vim-markdown')
" search inside of vim
call dein#add('rking/ag.vim')
" multiple cursors with ctrl-n
call dein#add('terryma/vim-multiple-cursors')
" easy copy code for presentations
call dein#add('zerowidth/vim-copy-as-rtf')
" nice ui for open files
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" autocomplete brackets and quotations
call dein#add('itmammoth/doorboy.vim')

"project wide search and replace
call dein#add('eugen0329/vim-esearch')

"gitgutter
call dein#add('airblade/vim-gitgutter')

" For async completion
call dein#add('Shougo/deoplete.nvim')

" For Denite features
call dein#add('Shougo/denite.nvim')

" javascript
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
" syntax highlighting
call dein#add('pangloss/vim-javascript')
" support jsdoc
call dein#add('heavenshell/vim-jsdoc')
" typescript syntax
call dein#add('HerringtonDarkholme/yats.vim')

" elixir
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'

"theme (Oceanic-next)
call dein#add('mhartington/oceanic-next')

" make html edition work in a sane way
call dein#add('tristen/vim-sparkup')
" work with handlebars
call dein#add('nono/vim-handlebars')

""""""""""
" neovim "
""""""""""
" linting
call dein#add('w0rp/ale')

"""""""""""""""""""""""""""""""""
" Tim Pope is teh vim superhero "
""""""""""""""""""""""""""""""""""
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()

" dein expects this
filetype plugin indent on

"""""""""""""
" /dein "
"""""""""""""

" set ',' as leader
let mapleader=","

"""""""""""""
" Look nice "
""""""""""""""
" theme settings
if (has("termguicolors"))
  set termguicolors
endif

colorscheme OceanicNext

" faster updatetime
set updatetime=300

" show linenumbers
set number
set numberwidth=1

""""""""""""""
" Whitespace "
""""""""""""""
" a tab is two spaces
set tabstop=2 shiftwidth=2
" use spaces, not tabs
set expandtab
" wrap lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79
" show end of lines
set list
set listchars=tab:\ \ ,trail:·,eol:~

"""""""""""""
" Searching "
"""""""""""""
" ignore case on search
set ignorecase
" unless they contain at least one capital letter
set smartcase

" dismiss highlighted search items on leader+space
nnoremap <leader><space> :noh<cr>

"""""""""""""""
" Keybindings "
"""""""""""""""

"""""""""""""""""""""
" window navigation "
"""""""""""""""""""""
" ease up window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" because neovim is still alpha and without this <C-h> does not work
" see https://github.com/neovim/neovim/issues/2048
nmap <BS> <C-W>h

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" make it easy to resize windows
map + <C-W>+
map - <C-W>-
map ö <C-W><
map ä <C-W>>

""""""""
" misc "
""""""""
" no need for swapfiles¬
set noswapfile

" f9 to turn on/off highlighting of the current line
noremap <silent><f9> :set cursorline!<cr>

"""""""""""""""""
" Terminal mode "
"""""""""""""""""
tnoremap <leader><ESC> <C-\><C-n>

""""""""""""""""""""""""
" plugin customization "
""""""""""""""""""""""""
" graphical vim undo gundo
nnoremap <F4> :GundoToggle<CR>
" close Gundo on revert
let g:gundo_close_on_revert=1

" NERDTree customization
map <leader><TAB> :<C-U>NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" NERDCommenter - always use one space between comment and code
let NERDSpaceDelims=1

" show YankRing history
nnoremap <silent> <F1> :YRShow<cr>
inoremap <silent> <F1> <ESC>:YRShow<cr>

" remap ctrlp to <leader>t
let g:ctrlp_map = '<leader>t'
" ignore tmp directory for ctrlp
set wildignore+=*/tmp/*,tmp,node_modules,*/dist
" map `;` to open ctrlp in buffermode
nnoremap ; :CtrlPBuffer<CR>

" make ZoomWinTabToggle work on <leader>0
map <leader>0 :ZoomWinTabToggle<CR>

" align selected lines on '='
map <leader>9 :Tabularize/=<cr>

" yanking should save to system clipboard
set clipboard=unnamed
" to toggle when pasting from clipboard
set pastetoggle=<F10>

" Use powerline symbols
let g:airline_powerline_fonts=1
let g:airline_theme='base16_ocean'

"""""""
" Ale "
"""""""
" show linting erros in quickfix list
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
"show errors in list
let g:ale_open_list=1

""""""""""""
" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup=1
" use supertab for running through deoplete
let g:SuperTabDefaultCompletionType='<c-n>'
""""""""""""
" Vim-Devicons "
""""""""""""
let g:NERDTreeGitStatusNodeColorization = 1
" 
let g:webdevicons_enable_denite = 0
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

""""""""""""""""""""
" esearch settings "
""""""""""""""""""""
let g:esearch#cmdline#help_prompt = 1
let g:esearch#cmdline#dir_icon = ''
let g:esearch = {
\ 'adapter':    'ag',
\ 'backend':    'nvim',
\ 'use':        ['visual', 'hlsearch', 'last'],
\}

let g:NERDTreeGitStatusIndicatorMap = {
\ 'Modified'  : '✹',
\ 'Staged'    : '✚',
\ 'Untracked' : '✭',
\ 'Renamed'   : '➜',
\ 'Unmerged'  : '═',
\ 'Deleted'   : '✖',
\ 'Dirty'     : '✗',
\ 'Clean'     : '✔︎',
\ 'Ignored'   : '',
\ 'Unknown'   : '?'
\ }
