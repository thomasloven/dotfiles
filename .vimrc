" Deactivate vi mode
set nocompatible

" Syntax highlighting and line numbering
syntax on
set number
set background=dark

" Don't save backups
set nobackup
set nowritebackup
set noswapfile

" Tabs should be tabs and 4 spaces wide.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
" Display tab characters
set list
set listchars=tab:>-

" Use utf-8 encoding
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Ctrl+o toggles the line numbering mode
function! g:ToggleNuMode()
    if(&rnu==1)
        set nu
    else
        set rnu
    endif
endfunc

nnoremap <c-o> :call g:ToggleNuMode()<cr>

" Leader key is comma (,)
let mapleader = ","

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
" Use tab to jump between brackets
nnoremap <tab> %
vnoremap <tab> %

" Fix line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

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
nnoremap k gk

" Use jj to leave insert mode
inoremap jj <ESC>

" Window split movement
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

call pathogen#infect()
nnoremap <C-p> <C-]>

" Forgot to opena file with sudo? No problem w!! writes anyway
cmap w!! w !sudo dd of=%

" ,q to open NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>

" ,j to add a line below, ,k above
nnoremap <leader>j o<esc>k
nnoremap <leader>k O<esc>j
