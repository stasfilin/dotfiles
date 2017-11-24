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

"Theme
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'motemen/git-vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Code complete
NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'majutsushi/tagbar'

" Python
NeoBundle 'davidhalter/jedi-vim'
NeoBundleLazy 'lambdalisue/vim-pyenv', {
        \ 'depends': ['davidhalter/jedi-vim'],
        \ 'autoload': {
        \   'filetypes': ['python', 'python3'],
        \ }}
NeoBundle 'klen/python-mode'


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
set gdefault
set ignorecase
set smartcase
set incsearch
nnoremap <silent> <cr> :nohlsearch<cr><cr>
set showmatch
set matchpairs+=<:>
set backspace=indent,eol,start
set number

set nobackup
set nowritebackup
set noswapfile


"NERDTree settings
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=0
nmap <silent> <leader>f :NERDTreeFind<CR>
map <Leader>t :NERDTreeToggle<CR>

"Tagbar settings
nnoremap <F8> :TagbarToggle<CR>



"Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled=1

"Style
syntax enable

colorscheme desert
let g:solarized_termcolors=256


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


"Python
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0
let g:pymode_run = 0


let g:jedi#popup_select_first = 0

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with