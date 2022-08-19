" system
set nobackup	"Don't make backup
set noswapfile	"Don't make swapfile
set tabstop=4
set expandtab
set shiftwidth=4

" terminal
if has('nvim')
    command! -nargs=* Term split | terminal <args>
    command! -nargs=* Vterm vsplit | terminal <args>
    autocmd TermOpen * startinsert
endif

" F12で行番号の相対表示切り替え
map <F12> :set relativenumber!<CR>

" ui
set mouse=a	" use mouse
set number	" number
set list	" indent
set cursorline	" Emphasis cursorline
set visualbell
"syntax enable

" encode
set encoding=utf-8

" auto brackets
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" keymap
" nnoremap j k
" nnoremap k j
inoremap <silent> uu <ESC>
nnoremap ; :
nnoremap : ;
nnoremap <CR> o<ESC>

" plugin
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/fuyuaice/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/fuyuaice/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/fuyuaice/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('itchyny/lightline.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
