""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.vim/plugged')

"""""""""""
" Plugins "
"""""""""""
"""""""
" coc "
"""""""
" Build from source code by use yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Coc ember support
Plug 'nullvoxpopuli/coc-ember', {'do': 'yarn install --frozen-lockfile'}
" work with hbs in ember
Plug 'joukevandermaas/vim-ember-hbs'

"""""""""""""""""""
" Various plugins "
"""""""""""""""""""
" Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/zoomwintab.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'hallison/vim-markdown'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

"theme (Oceanic-next)
Plug 'mhartington/oceanic-next'

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

"""""""""""""""""""""
" Coc customization "
"""""""""""""""""""""
" always show signcolum
set signcolumn=yes
" smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" show hover diagnostics coc - mimics gh from vsCode
nmap gh :call CocAction('diagnosticInfo')<Cr>
nmap gd :call CocAction('doHover')<Cr>

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" fuzzy-find files coc"
map <leader>t :CocList files<cr>
" fuzzy-find buffers
map <leader>b :CocList buffers<cr>

" install the following coc-extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-lists',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-highlight',
  \ 'coc-pairs',
  \ 'coc-emmet',
  \ 'coc-git',
  \ 'coc-elixir'
\ ]
