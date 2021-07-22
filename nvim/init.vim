syntax on
set t_Co=256

set autoindent
set smartindent
set expandtab
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs-2,cp932,sjis
set tabstop=4
set shiftwidth=4
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
set clipboard+=unnamed
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" htmlのマッチするタグに%でジャンプ
source $VIMRUNTIME/macros/matchit.vim

let g:preview_markdown_vertical=1

autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

noremap w k
noremap a h
noremap s j
noremap d l

noremap OW <C-w>k
noremap OA <C-w>h
noremap OS <C-w>j
noremap OD <C-w>l


noremap q a
noremap ee dd
noremap <C-s> w
noremap <C-w> b

inoremap ff <Esc>
vnoremap ff <Esc>

nmap <silent> <space>fm <Plug>(coc-format)
noremap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>df <Plug>(coc-definition)


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


" defx
call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })
autocmd VimEnter * execute 'Defx'
nnoremap <silent> <space>ee :<C-u>Defx<CR>


