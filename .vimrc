" Deactivate vi mode
set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:localvimrc_sandbox=0
" Syntax highlighting and line numbering
set t_Co=256
syntax on
colorscheme blackboard
set number
set background=dark

" Leader key is comma (,)
let mapleader = ","

" Don't save backups
set nobackup
set nowritebackup
set noswapfile

" Tabs should be tabs and 4 spaces wide.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab


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

" Display tab characters and toggle with <leader>l
set list
nnoremap <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬

" Ctrl+o toggles the line numbering mode
function! g:ToggleNuMode()
    if(&rnu==1)
        set nu
    else
        set rnu
    endif
endfunc

nnoremap <leader>o :call g:ToggleNuMode()<cr>


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

" Auto completion on <leader><tab> ( should try to find a better mapping...
inoremap <leader><tab> <C-N>

" Fix line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79

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
inoremap kj <ESC>
vnoremap ä <ESC> 

" Window split movement
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

call pathogen#infect()
nnoremap <C-p> <C-]>

" Forgot to open a file with sudo? No problem w!! writes anyway
cmap w!! w !sudo dd of=%

" ,q to open NERDTree
nnoremap <leader>q :NERDTreeToggle<cr>

" ,j to add a line below, ,k above
nnoremap <leader>j o<esc>k
nnoremap <leader>k O<esc>j

" Tab commands
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

" Toggle comments with space
nnoremap <space> za

" Enter commands with the ö-key (Swedish keyboards)
nnoremap ö :

" Use <leader>ev to Edit .Vimrc
" Use <leader>sv to Source .Vimrc
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>

" <leader>b lists buffers
nnoremap <leader>b :LustyJuggler<cr>

" <leader>u shows undo tree
nnoremap <leader>u :GundoToggle<cr>

" Enable powerline symbols
let g:Powerline_symbols='fancy'

filetype plugin on

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

