""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.vim/plugged')

"""""""""""
" Plugins "
"""""""""""
" Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/zoomwintab.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hallison/vim-markdown'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

"theme (Oceanic-next)
Plug 'mhartington/oceanic-next'

" make html edition work in a sane way
Plug 'tristen/vim-sparkup'
" work with handlebars
Plug 'nono/vim-handlebars'

""""""""""
" neovim "
""""""""""
" Plug 'benekastah/neomake'
" Plug 'Shougo/deoplete.nvim'
" linting
" Plug 'w0rp/ale'

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
" let g:ale_set_loclist=0
" let g:ale_set_quickfix=1
"show errors in list
" let g:ale_open_list=1

""""""""""""
" Deoplete "
""""""""""""
" let g:deoplete#enable_at_startup=1
" use supertab for running through deoplete
" let g:SuperTabDefaultCompletionType='<c-n>'
