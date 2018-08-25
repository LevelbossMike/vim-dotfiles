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
" Plug 'vim-scripts/YankRing.vim'
call dein#add('vim-scripts/zoomwintab.vim')
call dein#add('ervandew/supertab')
call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/nerdtree')
call dein#add('godlygeek/tabular')
call dein#add('kien/ctrlp.vim')
call dein#add('sjl/gundo.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('hallison/vim-markdown')
call dein#add('rking/ag.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('zerowidth/vim-copy-as-rtf')
call dein#add('pangloss/vim-javascript')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Raimondi/delimitMate')

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
" Plug 'benekastah/neomake'
call dein#add('Shougo/deoplete.nvim')
" linting
call dein#add('w0rp/ale')

"""""""""""""""""""""""""""""""""
" Tim Pope is teh vim superhero "
""""""""""""""""""""""""""""""""""
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
" Has to be last according to docs
call dein#add('ryanoasis/vim-devicons')

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
