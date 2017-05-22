set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'cppnav'
Plugin 'omnicppcomplete'
Plugin 'vim-syntastic/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'ltlollo/diokai'
Plugin 'rhysd/vim-clang-format'
Plugin 'bbchung/gtags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'FuzzyFinder'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'brookhong/cscope.vim'
Plugin 'chazy/cscope_maps'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'valloric/youcompleteme'
call vundle#end()

filetype plugin indent on
syntax enable

set mouse=a

set autoread

"Control-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
"nmap <C-x>d :YcmCompleter GoToDeclaration<CR>
"nmap <C-x>s :YcmCompleter GoTo<CR>

"Fuzzy finder 
nmap <F2> :FufBuffer<CR>
nmap <F3> :FufFileWithCurrentBufferDir<CR>
highlight Pmenu ctermbg = cyan ctermfg = black

"NERDCommenter
let mapleader = ","


nmap <C-k> m`O<C-[>j``
nmap <C-j> m`o<C-[>k``
map Q <Esc>

set tags=tags
set path=.

command! W w
command! Wq wq
command! Wqa wqa
command! Q q

set shiftwidth=2
set softtabstop=2
set nu
set bg=dark
set ts=2

augroup filetypedetect
	    au BufRead,BufNewFile *.h set filetype=c
	    au BufRead,BufNewFile *.capnp set filetype=cpp
augroup END

autocmd Filetype cpp setlocal expandtab
autocmd Filetype c setlocal noexpandtab

set backspace=2

"gtags
":map <C-\> :Gtags -r<CR><CR>
:map <F10> :cclose<CR>
:map <F9> :cp<CR>
:map <F12> :cn<CR>
:map <C-\> :GtagsCursor<CR><CR>
let g:Gtags_Auto_Update = 1
"let g:Gtags_No_Auto_Jump = 1
"let g:Gtags_Close_When_Single = 1

"syntastic
"let g:syntastic_cpp_cpplint_exec = 'cpplint'
"clang format
":map <C-=> :ClangFormat<CR>
colorscheme diokai

"colored line at 81 column
set textwidth=80
set colorcolumn=+1
hi ColorColumn guibg=#2d2d2d ctermbg=246

"fswitch
command! A FSHere
command! Z FSSplitAbove

autocmd VimEnter * call MakeSnip("python", "embed", "from IPython import embed; embed()")

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
