" Deactivate vi mode
set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on

let g:localvimrc_sandbox=0
"
" Leader key is comma (,)
let mapleader = ","
let localmapleader = ","


" DISPLAY {{{

" Use utf-8 encoding
set encoding=utf-8
set noshowmode
set showcmd
set visualbell
set cursorline
set ruler
set laststatus=2

set ttyfast


" Syntax highlighting and line numbering
set t_Co=256
syntax enable
let g:CSApprox_loaded = 1
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE


" Line numbering
set number
function! g:ToggleNuMode()
  if(&rnu==1)
    set nu
  else
    set rnu
  endif
endfunc
" Ctrl+o toggles the line numbering mode
nnoremap <leader>o :call g:ToggleNuMode()<cr>


" Display tab characters and toggle with <leader>l
set list
nnoremap <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬,nbsp:·
set showbreak=↪


" Enable powerline symbols
let g:Powerline_symbols='fancy'
let g:Powerline_theme="default"
"let g:Powerline_colorscheme="skwp"
let g:Powerline_colorscheme="solarized16"

" }}}


" FILE MANAGEMENT {{{
"
" Don't save backups
set nobackup
set nowritebackup
set noswapfile
set hidden


" Forgot to open a file with sudo? No problem w!! writes anyway
cmap w!! w !sudo dd of=%


" Fc save and close buffer
" fq close buffer without saving
function! CleanClose(toSave)
  if (a:toSave == 1)
    w!
  endif
  let todelbufNr = bufnr("%")
  let newbufNr = bufnr("#")
  if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
  else
    bnext
  endif

  if (bufnr("%") == todelbufNr)
    new
  endif
  exe "bw!".todelbufNr
endfunction

map fq <esc>:call CleanClose(0)<cr>
map fc <esc>:call CleanClose(1)<cr>


" Use <leader>ev to Edit .Vimrc
" Use <leader>sv to Source .Vimrc
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>


" ,b lists buffers
nnoremap <leader>b :LustyJuggler<cr>

"}}}


" FORMATING {{{

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

autocmd FileType make setlocal ts=8 sts=8 sw=8 noet
autocmd FileType c setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType mkd setlocal ts=4 sts=4 sw=4 noet


" Line wrapping settings
set wrap
set textwidth=72
set formatoptions=qrn1
set colorcolumn=+1
set formatprg=par



"}}}


" SEARCHING {{{
" Some useful search settings
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Use <leader><space> to turn off syntax highlighting
nnoremap <leader><space> :noh<cr>

" }}}


" NAVIGATION {{{

set scrolloff=3

" Turn off the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $

" Window split movement
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-w>- <C-w>s
nnoremap <C-w>/ <C-w>v
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use tab to jump between brackets
nnoremap <tab> %
vnoremap <tab> %

" Tab commands
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

"}}}


" COMMAND KEYS {{{

set ttimeout
set ttimeoutlen=100

set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest


" Enter commands with the ö-key (Swedish keyboards)
noremap ö :

" ,j to add a line below, ,k above
nnoremap <leader>j o<esc>k
nnoremap <leader>k O<esc>j

" Insert or append single characters with ,i and ,a
nnoremap <leader>i i<space><esc>r
nnoremap <leader>a a<space><esc>r


" ä is easier to type than ` for navigating marks
noremap ä `

" å for marks navigation
noremap å [
noremap ¨ ]
" For computer where ¨ is a dead key
noremap Å ]



" ,q or § to open NERDTree
nnoremap <leader>q :NERDTreeTabsToggle<cr>
nnoremap <silent> § :NERDTreeTabsToggle<cr>


" <leader>u shows undo tree
nnoremap <leader>u :GundoToggle<cr>


" Auto completion on <leader><tab> ( should try to find a better mapping...
inoremap <leader><tab> <C-N>
nnoremap <leader>p :TagbarToggle<cr>

"}}} COMMAND KEYS



" Tab commands
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

" FOLDING {{{
" Toggle folds with space
nnoremap <space> za
" Fold between {{{ and }}}
set foldmethod=marker
" }}}

let g:SupertabDefaultCompletionType = "context"

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

noh
