" Deactivate vi mode
set nocompatible

filetype off
set rtp +=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdtree'
Bundle 'embear/vim-localvimrc'
Bundle 'autre/Rainbow-Parenthsis-Bundle'
Bundle 'tpope/vim-fugitive'
Bundle 'sjbach/lusty'
Bundle 'tpope/vim-surround'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'majutsushi/tagbar'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'thomasloven/vim-tstatus'

Bundle 'EasyMotion'
Bundle 'ctrlp.vim'
Bundle 'tComment'

" :BundleList
" :BundleInstall
" :BundleInstall! 
" :BundleClean

"call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on

let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
let g:LatexBox_Folding=1
let g:solarized_termtrans=1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
"
" Leader key is comma (,)
let mapleader = ","
let maplocalleader = ","


" DISPLAY {{{

set encoding=utf-8
set noshowmode
set showcmd
set visualbell
set cursorline
augroup au_cursorline
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au Winleave * setlocal nocursorline
augroup END
set colorcolumn=+1
set ruler
set laststatus=2
set ttyfast
set lazyredraw
set title


" SYNTAX HIGHLIGTING {{{
set t_Co=256
syntax enable
set background=dark

" SYNTAX HIGHLIGTING }}}


" COLOR MAPPINGS {{{

" Colorized background in vimdiff

hi SpellBad cterm=undercurl ctermfg=1

" Change some colors
augroup colors
  au!
  au colorscheme * hi DiffAdd ctermfg=0 ctermbg=2
  au colorscheme * hi DiffDelete ctermfg=0 ctermbg=1
  au colorscheme * hi DiffText ctermfg=0 ctermbg=4
  au colorscheme * hi SignColumn ctermbg='NONE'
augroup END
colorscheme solarized
let g:signify_sign_color_ctermbg='NONE'

" Colors for interesting words
hi def InterestingWord1 ctermfg=16 ctermbg=1
hi def InterestingWord2 ctermfg=16 ctermbg=2
hi def InterestingWord3 ctermfg=16 ctermbg=3
hi def InterestingWord4 ctermfg=16 ctermbg=4
hi def InterestingWord5 ctermfg=16 ctermbg=5
hi def InterestingWord6 ctermfg=16 ctermbg=6


" Highlight interesting words with <leader>[1-6]
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<CR>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<CR>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<CR>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<CR>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<CR>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<CR>
vnoremap <silent> <leader>1 :call HiInterestingVisual(1)<CR>
vnoremap <silent> <leader>2 :call HiInterestingVisual(2)<CR>
vnoremap <silent> <leader>3 :call HiInterestingVisual(3)<CR>
vnoremap <silent> <leader>4 :call HiInterestingVisual(4)<CR>
vnoremap <silent> <leader>5 :call HiInterestingVisual(5)<CR>
vnoremap <silent> <leader>6 :call HiInterestingVisual(6)<CR>
nnoremap <silent> <leader><space> :call UnHiInterestingWord()<CR>:noh<CR>

" COLOR MAPPINGS }}}
" Show why a word is highlighted as it is
nnoremap <leader>ss :call SynStack()<CR>

" LINE NUMBERS {{{
" Line numbering
set number
" <leader>o toggles the line numbering mode
nnoremap <leader>o :call g:ToggleNuMode()<cr>
" LINE NUMBERS }}}


" HIDDEN CHARACTERS {{{
" Display tab characters and toggle with <leader>l
set list
nnoremap <leader>l :set list!<cr>
set listchars=tab:▸\ ,eol:¬,nbsp:·
set showbreak=↪
" HIDDEN CHARACTERS }}}


" POWERLINE PLUGIN {{{
" Enable powerline symbols
let g:Powerline_symbols='fancy'
let g:Powerline_theme="default"
"let g:Powerline_colorscheme="skwp"
let g:Powerline_colorscheme="solarized16"
" POWERLINE PLUGIN }}}

" Show position
nnoremap <c-z> mzzMzvzz5<c-e>`z:Pulse<CR>

" FOLDING {{{
" Toggle folds with space
nnoremap <space> za
" Fold between {{{ and }}}
set foldmethod=marker
" }}}

" DISPLAY }}}


" FILE MANAGEMENT {{{
"
" Don't save backups
set nobackup
set nowritebackup
set noswapfile
set hidden


" Forgot to open a file with sudo? No problem w!! writes anyway
cmap w!! w !sudo dd of=%


" BUFFERS {{{
" Fc save and close buffer
" fq close buffer without saving
map fq <esc>:call CleanClose(0)<cr>
map fc <esc>:call CleanClose(1)<cr>

" ,b lists buffers
nnoremap <leader>b :LustyJuggler<cr>

"BUFFERS }}}


" Use <leader>ev to Edit .Vimrc
" Use <leader>sv to Source .Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>


" Fugitive mappings
nnoremap <leader>gs :Gstat<CR>
nnoremap <leader>gd :Gdiff<CR>


" ,q or § to toggle NERDTree
nnoremap <silent> <leader>q :NERDTreeTabsToggle<cr>
nnoremap <silent> § :NERDTreeTabsToggle<cr>

set makeprg=make\ -w

function! RenameFile(copy)
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    if a:copy == 0
      exec ':silent !rm ' . old_name
    endif
    redraw!
  endif
endfunction

noremap <leader>n :call RenameFile(0)<cr>
noremap <leader>c :call RenameFile(1)<cr>

"}}}


" TEXT FORMATING {{{

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent


" Line wrapping settings
set wrap
set textwidth=72
set formatoptions=qrn1
set formatprg=par


" ,j to add a line below, ,k above
nnoremap <leader>j o<esc>k
nnoremap <leader>k O<esc>j


" Insert or append single characters with ,i and ,a
nnoremap <leader>i i<space><esc>r
nnoremap <leader>a a<space><esc>r

"}}}


" SEARCHING {{{
"
" I almost always want very magic search
nnoremap / /\v
vnoremap / /\v

" Don't move when searching for word under cursor
nnoremap * *<c-o>

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
noh

" Tag jumping with <c-¨> and <c-å>
" <c-¨> registers as <c-^> in terminal...
" <c-å> registers as <-]>
nnoremap <c-^> <c-]>mzzvzz5<c-e>`z:Pulse<CR>
nnoremap <c-]> <c-w>v<c-w>l<c-]>mzzvzz5<c-e>`z:Pulse<CR>


" }}}


" NAVIGATION {{{

set scrolloff=3

" Turn off the arrow keys
" Actually, I think I'm ready to turn them on again
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Navigate split lines correctly
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $

" ä is easier to type than ` for navigating marks
" and is also right next to '
noremap ä `

" Jump between windows
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

" ,, to switch to previous file
nnoremap <leader><leader> <c-^>

"}}}


" COMMAND KEYS {{{

set ttimeout
set ttimeoutlen=100

set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*~,*.d

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-w>- <C-w>s
nnoremap <C-w>/ <C-w>v

" Enter commands with the ö-key (Swedish keyboards)
noremap ö :

set mouse=a

" <leader>u shows undo tree
nnoremap <silent> <leader>u :GundoToggle<cr>
let g:gundo_preview_bottom=1

" <leader>p shows the tag bar
nnoremap <silent> <leader>p :TagbarToggle<cr>

let g:SupertabDefaultCompletionType = "context"

nnoremap <leader>ri :call InlineVariable()<cr>
"}}} COMMAND KEYS


" FILETYPE {{{

autocmd FileType make setlocal ts=8 sts=8 sw=8 noet foldmethod=indent
autocmd FileType c setlocal ts=2 sts=2 sw=2 expandtab foldmethod=marker foldmarker={,}

autocmd FileType mkd setlocal ts=4 sts=4 sw=4 noet foldmethod=syntax
"autocmd FileType tex setlocal foldmarker=(fold),(end)

augroup au_python
  au!
  autocmd FileType python map ,m :w<cr>:execute '!python %'<cr>
  autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setlocal foldmethod=indent
augroup END

" FILETYPE }}}

" FUNCTIONS {{{

function! g:ToggleNuMode() "{{{
" Toggle absolute and relative numbering mode
  if(&rnu==1)
    set nu
  else
    set rnu
  endif
endfunc "}}}

function! CleanClose(toSave) "{{{
" Close files and remove buffers
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
endfunction "}}}

function! SynStack() "{{{
" Shows the syntax highlighting stack
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc "}}}

function! s:Pulse() "{{{
" Pulse - An awesome function by Steve Losh
  let current_window = winnr()
  windo set nocursorline
  execute current_window . 'wincmd w'
  setlocal cursorline

  redir => old_hi
    silent execute 'hi CursorLine'
  redir END
  let old_hi = split(old_hi, '\n')[0]
  let old_hi = substitute(old_hi, 'xxx', '', '')

  let steps = 9
  let width = 1
  let start = width
  let end = steps * width
  let color = 233

  for i in range(start, end, width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor
  for i in range(end, start, -1 *width)
    execute "hi CursorLine ctermbg=" . (color + i)
    redraw
    sleep 6m
  endfor

  execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

function! HiInterestingWord(n) "{{{
" Highlight word - Another awesome function by Steve Losh
  normal! mz
  normal! "zyiw
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
  let pat = '\V\<' . escape(@z, '\') . '\>'
  call matchadd("InterestingWord" . a:n, pat, 1, mid)
  normal! `z
endfunction "}}}

function! HiInterestingVisual(n) "{{{
  normal! gv"zy
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
  let pat = '\V' . escape(@z, '\')
  call matchadd("InterestingWord" . a:n, pat, 1, mid)
  normal! gv
endfunction "}}}

function! UnHiInterestingWord() "{{{
" Unhighlight word functin - By me :)
  for i in range(1,6,1)
    let mid = 86750 + i
    silent! call matchdelete(mid)
  endfor
endfunction "}}}

" InlineVariable - by Gary Bernhardt {{{
" Changes
"   a = 123;
"   b = a*5;
" to
"   b = 123*5;
function! InlineVariable()
  let l:tmp_a = @a
  normal "ayiw
  normal 2daw
  let l:tmp_b = @b
  normal "bd$
  normal dd
  normal k$
  exec '/\<' . @a . '\>'
  exec ':s//' . @b
  let @a = l:tmp_a
  let @b = l:tmp_b
endfunction "}}}

function! Preserve(command) "{{{
" Preserve by Jonathan Palardy
  let _s=@/
  let l=line(".")
  let c=col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction "}}}

command! -complete=shellcmd -nargs=+ Shell silent call s:RunShellcommand(<q-args>)
command! -nargs=* Make silent call s:RunShellcommand('make '.<q-args>)
function! s:RunShellcommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded form:  ' . expanded_cmdline)
  call setline(3, substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" }}}
