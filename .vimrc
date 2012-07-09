"first step :
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"github repos
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'



"vim-scripts repos
Bundle 'CCTree'


"other repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on


" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
