syntax on
set t_Co=256

set autoindent
set smartindent
set expandtab
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
set tabstop=2
set shiftwidth=2
set cursorline
set number
set showmode
set showmatch
set title
set backspace=indent,eol,start
set inccommand=split
set imdisable
set hidden
set nobackup
set nowritebackup
set conceallevel=0
" htmlのマッチするタグに%でジャンプ
source $VIMRUNTIME/macros/matchit.vim

let g:preview_markdown_vertical=1

noremap w k
noremap a h
noremap s j
noremap d l

noremap q a
noremap ee dd
noremap <C-w><C-w> w
noremap <C-s><C-s> b

inoremap ff <Esc>
vnoremap ff <Esc>

hi Comment ctermfg=gray

if has('mouse')
  set mouse=a
endif

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable