" Deactivate vi mode
set nocompatible

filetype off

" Neobundle - plugin management {{{
if has('vim_starting')
  set rtp +=~/.vim/bundle/neobundle.vim
endif
let g:neobundle#types#git#default_protocol='https'
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}

" Vimproc - allows for asyncronous execution of external programs {{{
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \  'windows' : 'make -f make_mingw32.mak',
  \  'cygwin' : 'make -f make_cygwin.mak',
  \  'mac' : 'make -f make_mac.mak',
  \  'unix' : 'make -f make_unix.mak',
  \  },
  \ }
" }}}

" Unite - unified searching {{{
NeoBundle 'Shougo/unite.vim'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_split_rule = 'rightbelow'
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  nmap <buffer> <C-j> <Plug>(unite_select_next_line)
  nmap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction
" }}}


" localvimrc - source .lvimrc from project root {{{
NeoBundle 'embear/vim-localvimrc'
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
" }}}

" Syntastic - automatic syntax checking {{{
NeoBundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
" }}}

" commentary - toggle commenting {{{
NeoBundle 'tpope/vim-commentary'
augroup commentary
  au!
  autocmd filetype asm set commentstring=;\ %s
augroup END
" }}}


" surround - add and change surrounding "({[' and so on
NeoBundle 'tpope/vim-surround'

" TODO: Find a good latex plugin or write one
" LaTeX-Box - latex functions
" NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
" let g:LatexBox_Folding=1

" Navigation
" Nerdtree - file navigator
NeoBundle 'scrooloose/nerdtree'
" Lusty - buffer navigator (may be replaced by unite)
NeoBundle 'sjbach/lusty'
" CtrlP - file finder (may be replaced by unite)
NeoBundle 'ctrlp.vim'
" tagbar - navigate tags in file (may be replaced by unite)
NeoBundle 'majutsushi/tagbar'
" Easymotion - more advanced jumping
NeoBundle 'EasyMotion'
" Gundo - undo tree visualiser
NeoBundle 'sjl/gundo.vim'
let g:gundo_preview_bottom=1

" Git integration
NeoBundle 'tpope/vim-fugitive'
" Signify - show git differences in gutter
NeoBundle 'mhinz/vim-signify'
let g:signify_sign_overwrite = 0

" Completion
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_confirm_extra_conf=0
NeoBundle 'ervandew/supertab'
let g:SupertabDefaultCompletionType = "context"
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'

" Looks
NeoBundle 'thomasloven/vim-tstatus'
NeoBundle 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
NeoBundle 'sjl/badwolf.git'
NeoBundle 'Mustang2'

NeoBundle 'TagHighlight'

"call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on

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
  " au colorscheme * hi PmenuSel ctermbg=0 ctermfg=3
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
vnoremap <silent> <leader>1 :call HiInterestingVisual(1)<CR>
vnoremap <silent> <leader>2 :call HiInterestingVisual(2)<CR>
vnoremap <silent> <leader>3 :call HiInterestingVisual(3)<CR>
vnoremap <silent> <leader>4 :call HiInterestingVisual(4)<CR>
vnoremap <silent> <leader>5 :call HiInterestingVisual(5)<CR>
vnoremap <silent> <leader>6 :call HiInterestingVisual(6)<CR>

" COLOR MAPPINGS }}}

" LINE NUMBERS {{{
" Line numbering
set number
" LINE NUMBERS }}}


" HIDDEN CHARACTERS {{{
" Display tab characters and toggle with <leader>l
set list
set listchars=tab:▸\ ,eol:¬,nbsp:·
set showbreak=↪
" HIDDEN CHARACTERS }}}

" FOLDING {{{
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

"}}}


" SEARCHING {{{
"
" I almost always want very magic search
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
noh

" }}}


" NAVIGATION {{{

set scrolloff=3


nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $

" Jump between windows

" Use tab to jump between brackets
vnoremap <tab> %
"}}}


" COMMAND KEYS {{{

set ttimeout
set ttimeoutlen=100

set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*~,*.d

set mouse=a
"}}} COMMAND KEYS

" Key bindings {{{
"   Normal mode {{{

" !: VimProcBang
" !!: VimProcRead
nnoremap ! :VimProcBang 
nnoremap !! :VimProcRead 
" §: toggle NERDTree
nnoremap <silent> § :NERDTreeTabsToggle<cr>
" /: search, but in very magic mode
nnoremap / /\v
" ,1-6: highlight interesting words
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<CR>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<CR>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<CR>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<CR>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<CR>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<CR>
" tab: Jump between brackets
nnoremap <tab> %
" q: Record macro
" Q: Append macro
" ,q: close all (don't save)
nnoremap <leader>q :qall!<CR>
" w: Move forward one word
" W: Move forward one Word
" ,w: XXX
" <C-w>: window commands
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-w>- <C-w>s
nnoremap <C-w>/ <C-w>v
" e: XXX
" E: XXX
" ,e: XXX
" ,ev: Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" r: replace character
" R: replace text
" ,r: XXX
" t: move To forward
" T: move To backward
" ,t: tab handling
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
" y: yank
" Y: yank rest or line
" ,y: XXX
" u: undo
" U: TODO: redo?
" ,u: show Gundo tree
nnoremap <silent> <leader>u :GundoToggle<cr>
" i: insert
" I: insert at beginning of line
" ,i: insert single character
nnoremap <leader>i i<space><esc>r
" o: open line below
" O: open line above
" ,o: toggle relative line numbers
nnoremap <leader>o :call g:ToggleNuMode()<cr>
" p: paste
" P: paste before
" ,p: show TagBar
nnoremap <silent> <leader>p :TagbarToggle<cr>
" å: XXX
" ^: XXX
" a: append
" A: append at end of line
" ,a: append single character
nnoremap <leader>a a<space><esc>r
" s: substitute?
" S: TODO ?
" ,s: XXX
" ,ss: show syntax highlighting stack (useful?)
" ,sv: resource vimrc
nnoremap <leader>ss :call SynStack()<CR>
nnoremap <leader>sv :so $MYVIMRC<cr>
" d: delete
" D: delete rest of line
" ,d: XXX
" f: find forward
" F: find backwards
" ,f: XXX
" fc: save and close buffer
" fq: close buffer without saving
map fq <esc>:call CleanClose(0)<cr>
map fc <esc>:call CleanClose(1)<cr>
" g: Many uses
" G: XXX
" ,g: XXX
" ,gs: Git status
" ,gd: Git diff
" ,gD: close Git diff
nnoremap <leader>gs :Gstat<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gD :diffoff!<cr><c-w>h:bd<cr>
" h: move left
" H: XXX
" ,h: XXX
" C-h: move to left window
nnoremap <C-h> <C-w>h
" j: move down
" J: join lines
" ,j: add empty line below
" C-j: move to window below
nnoremap j gj
nnoremap gj j
nnoremap <leader>j o<esc>k
nnoremap <C-j> <C-w>j
" k: move up
" K: lookup keyword
" ,k: add empty line above
" C-k: Move to window above
nnoremap k gk
nnoremap gk k
nnoremap <leader>k O<esc>j
nnoremap <C-k> <C-w>k
" l: move right
" L: go to lower screen
" ,l: toggle display of unprintable characters
" C-l: Move to right window
nnoremap <C-l> <C-w>l
nnoremap <leader>l :set list!<cr>
" ö: shortcut to command mode
noremap ö :
" ä: XXX
" ': XXX
" *: search for line under cursor, but don't move
nnoremap * *<c-o>
" <: decrease indent
" >: increase indent
" z: many uses
" Z: XXX
" ,z: XXX
" C-z: show current position
nnoremap <c-z> mzzMzvzz5<c-e>`z:Pulse<CR>
" x: delete character
" X: delete character backwards?
" ,x: XXX
" c: change
" C: change rest of line
" ,c: copy file and open copy
noremap <leader>c :call RenameFile(1)<cr>
" v: visual mode
" V: visual line
" ,v: XXX
" C-v: visual block
" b: back a word
" b: back a Word
" ,b: Buffer list (replace with unite?)
nnoremap <leader>b :LustyJuggler<cr>
" n: next search hit
" N: previous search hit
" ,n: move open file
noremap <leader>n :call RenameFile(0)<cr>
" m: XXX
" M: go to middle of screen
" ,m: XXX
" ,: leader key
" ;: XXX
" ,,: easymotion trigger
" .: repeat command
" :: command mode
" ,.: alternate file
noremap <leader>. <C-^>
" -: jump to mark line
" _: jump to mark
" ,-: XXX
" C--: Jump to tag
nnoremap - '
nnoremap _ `
nnoremap <c-_> <c-]>
" <space>: [unite] prefix
" <space>f: Unite file finder
" <space>b: Unite buffer select
" ,<space>: Remove search highlighting
nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files -no-split -start-insert file_rec/async:!<CR>
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffers -quick-match buffer file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register -no-split register<CR>
nnoremap <silent> <leader><space> :call UnHiInterestingWord()<CR>:noh<CR>
"   Normal mode }}}
" }}}

" FILETYPE {{{

autocmd FileType make setlocal ts=8 sts=8 sw=8 noet foldmethod=indent
autocmd FileType c setlocal ts=2 sts=2 sw=2 expandtab foldmethod=marker foldmarker={,}

autocmd FileType vim setlocal keywordprg=:help

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


function! Preserve(command) "{{{
" Preserve by Jonathan Palardy
  let _s=@/
  let l=line(".")
  let c=col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction "}}}

" }}}

NeoBundleCheck
