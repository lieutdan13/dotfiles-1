" Global settings
let mapleader = ","
let g:mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle shit
" 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
"Bundle 'ervandew/supertab'
Bundle 'https://bitbucket.org/ns9tks/vim-autocomplpop'

filetype plugin indent on

set history=400 "increase number of commands remembered
set autoread
set so=7 " when scrolling scroll the page 7 lines before top/bot of page
set number
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l " you can now use h and l to move to previous line
set lazyredraw " Don't constantly update screen when macros are running
set showmatch " hl matching brackets
set mat=2

" Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"let SuperTabDefaultCompletionType = "<C-X><C-O>"
" omnicompletion : words
inoremap <leader>, <C-x><C-o>

" omnicompletion : filenames
inoremap <leader>: <C-x><C-f>

" omnicompletion : lines
inoremap <leader>= <C-x><C-l>
set completeopt=longest,menuone

" We don't need sound or visual bells for errors thnx
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Search will ignore case unless caps used in search string
set ignorecase
set smartcase
set hlsearch
" turn off highlighting easily
map <silent> <leader><cr> :noh<cr>
set incsearch
set magic " use . $ etc with regex
" Don't use a swapfile, can be bad for large files
"set noswapfile

" Spacing and junk
set shiftwidth=4
set tabstop=4
set expandtab " uses spaces for tabs. damn you python
set smarttab
set ai " auto indent
set si " smart indent

" better linebreaks
set lbr
set tw=500
set wrap

" Visual mode easy searching by Michael Naumann
" In visual mode, press * or # searches for current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" I didn't want to say this in front of Patrick but that hat makes you look like a girl.
" Am I a pretty girl?
colorscheme jellybeans
set guifont=PragmataPro\ 12
set t_Co=256 " set 256 color mode, we want more colors
syntax enable
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove scrollbar
set guioptions-=l
set guioptions-=b
set guioptions-=L
set guioptions-=R
" moving aroud help

" move up and down between long lines better
map j gj
map k gk

" space becomes search, Ctrl-space is backwards search
map <space> /
map <c-space> ?

" Move between windows by using Ctrl-{h|j|k|l}
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" close current buffer
map <leader>bd :Bclose<cr>

" close all buffers
map <leader>ba :1,1000 bd!<cr>

" Return to last edit position when opening a file
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal! g`\"" | 
	\ endif
" remember info about buffers on close
set viminfo^=%

" Status line
set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Remap 0 to first non-blank char
map 0 ^

"Move a line of text using Alt+{j|k}
" disable winalt keys lol
set winaltkeys=no
"nmap <c-j> mz:m+<cr>`z
"nmap <c-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Key binds
"
" normal mode
nnoremap <leader>smc :vsplit ~/.vim/bundle/snipmate.vim/snippets/c.snippets<cr>
nnoremap <leader>d dd
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>pv :exec "!$HOME/bin/update_vimrc.sh"<cr>
nmap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>xp "+p


" visual mode
vnoremap <leader>xy "+y

" insert mode
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>Ui

" Snippets
inoremap <c-e> <c-o>:python zencoding_vim.expand_abbreviation()<cr>

" set addition and subtraction to ignore leading 0s
set nrformats=

" Lang specific stuff
"enable python extra highlighting
if has("eval")
  let python_highlight_all = 1
  let python_slow_sync = 1
endif

" Functions

" Delete trailing white space on save
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
