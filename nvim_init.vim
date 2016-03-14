""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.vim/plugged')

"""""""""""
" Plugins "
"""""""""""
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/zoomwintab.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hallison/vim-markdown'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'wikitopian/hardmode'
Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

"theme (Oceanic-next)
Plug 'mhartington/oceanic-next'

" make html edition work in a sane way
Plug 'tristen/vim-sparkup'
" work with handlebars
Plug 'nono/vim-handlebars'

" orgmode
Plug 'jceb/vim-orgmode'

" neovim
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'

"""""""""""""""""""""""""""""""""
" Tim Pope is teh vim superhero "
""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()
"
"""""""""""""
" /vim-plug "
"""""""""""""

" set ',' as leader
let mapleader = ","
" use ',' as localleader for orgmode
let maplocalleader = ";"

"""""""""""""
" Look nice "
""""""""""""""
" theme settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'

" show linenumbers
set number

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

" disable arrow keys because they make 'O' unusably slow
set noesckeys

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
let g:gundo_close_on_revert = 1

" NERDTree customization
map <leader><TAB> :<C-U>NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" NERDCommenter - always use one space between comment and code
let NERDSpaceDelims = 1

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

" Hard Mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Hard Mode per default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" make pasting from clipboard work (no indents etc.)
" set paste
" yanking should save to system clipboard (only works with macvim)
set clipboard=unnamed
" to toggle when pasting from clipboard
set pastetoggle=<F10>

" Use powerline symbols
let g:airline_powerline_fonts = 1

"""""""""""
" neomake "
"""""""""""
" lint on saving a buffer
autocmd! BufWritePost * Neomake
" open automatically when there are errors
let g:neomake_open_list = 2
" jshint for js files
autocmd FileType javascript let g:neomake_javascript_enabled_makers = ['jshint']
" show errors for warnings/errors
let g:neomake_warning_sign = { 'text': '->', 'texthl': 'WarningMsg', }
let g:neomake_error_sign = { 'text': '=>', 'texthl': 'ErrorMsg' }

""""""""""""
" Deoplete "
""""""""""""
let g:deoplete#enable_at_startup = 1
" use supertab for running through deoplete
let g:SuperTabDefaultCompletionType = '<c-n>'
