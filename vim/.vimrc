" --------------------------------------------------
" NEOBUNDLE
" --------------------------------------------------
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" --------------------------------------------------
" PLUGINS
" --------------------------------------------------

" Interface
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
NeoBundle 'tomasr/molokai'
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sjl/gundo.vim'
if executable('ack')
  NeoBundle 'mileszs/ack.vim'
endif

if executable('ag')
  NeoBundle 'rking/ag.vim'
endif

" VCS
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Editing
NeoBundle 'tpope/vim-surround'
NeoBundle 'editorconfig/editorconfig-vim'
" NeoBundle 'scrooloose/nerdcommenter'
" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'ervandew/supertab'
" NeoBundle 'godlygeek/tabular'
NeoBundle 'Raimondi/delimitMate'
"NeoBundle 'Chiel92/vim-autoformat'
" NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bronson/vim-trailing-whitespace'

" Language support
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-markdown'

" Webdev stuff
" NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'skammer/vim-css-color'
" NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'vim-scripts/JavaScript-Indent'

" Vundle End
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" --------------------------------------------------
" SYS
" --------------------------------------------------
set backupcopy=yes

" --------------------------------------------------
" GUI
" --------------------------------------------------
colorscheme molokai
set t_Co=256
syntax on
set background=dark
set guifont=Sauce\ Code\ Powerline\ Light\ 12
set number
set showmode
set sidescrolloff=2
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set ttyfast
set cursorline
set display+=lastline
set colorcolumn=120

" --------------------------------------------------
" TEXT FORMAT
" --------------------------------------------------
set linebreak

" --------------------------------------------------
" FILE ENCODING
" --------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" --------------------------------------------------
" TAB & INDENT
" --------------------------------------------------
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

" --------------------------------------------------
" SEARCH
" --------------------------------------------------
set incsearch
set smartcase

" --------------------------------------------------
" KEYMAP
" --------------------------------------------------
let mapleader = " "
map <C-n> :NERDTreeToggle<CR>
nnoremap <F12> :set invpaste paste?<CR>
" set pastetoggle=<F12>

" --------------------------------------------------
" PLUGIN SETTINGS
" --------------------------------------------------

" Ctrl P
let g:ctrlp_custom_ignore= &wildignore . '*/.git/*,*/.hg/*,*/.svn/*,*/bower_components/*,*/node_modules/*'
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lightline
let g:lightline = {
    \ 'colorscheme': 'default',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
set laststatus=2

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" JavaScript
let g:javascript_enable_domhtmlcss = 1

" EasyMotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

