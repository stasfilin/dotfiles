set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'motemen/git-vim'
NeoBundle 'bling/vim-airline'

" Code complete
NeoBundle 'Shougo/neocomplcache.vim'

" Python
NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy 'lambdalisue/vim-pyenv', {
        \ 'depends': ['davidhalter/jedi-vim'],
        \ 'autoload': {
        \   'filetypes': ['python', 'python3'],
        \ }}


"JavaScript
NeoBundle 'jelera/vim-javascript-syntax'


call neobundle#end()
NeoBundleCheck


let mapleader = ','


let g:acp_enableAtStartup = 0

filetype indent plugin on
syntax on

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set softtabstop=4
set gdefault
set ignorecase
set smartcase
set incsearch
nnoremap <silent> <cr> :nohlsearch<cr><cr>
set showmatch
set matchpairs+=<:>
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile


"NERDTree settings
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=0
nmap <silent> <leader>f :NERDTreeFind<CR>
map <Leader>t :NERDTreeToggle<CR>


"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 1

"Style
colorscheme desert


nmap <silent><leader>to :tabnew .<CR>

if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif