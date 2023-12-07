" System ----------------------------------------
set nobackup
set noswapfile
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
filetype plugin indent on
set list
set listchars=space:·
set wildmenu
set nowrap
set splitbelow
let mapleader="\<Space>"
set clipboard+=unnamedplus
" Terminal ----------------------------------------
if has('nvim')
    command! -nargs=* Term split | terminal <args>
    command! -nargs=* Vterm vsplit | terminal <args>
    autocmd TermOpen * startinsert
endif

" UI ----------------------------------------
set background=dark
set number relativenumber
map <F12> :set relativenumber!<CR>
set mouse=a
set cursorline
set visualbell
syntax enable

" key bindings ----------------------------------------
inoremap <silent> uu <ESC>
nnoremap ; :
nnoremap : ;
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" plugin----------------------------------------
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack',{'opt':1} " plugin manager
" ddc
Jetpack 'vim-denops/denops.vim'
Jetpack 'Shougo/ddc.vim'
Jetpack 'Shougo/pum.vim'
Jetpack 'Shougo/ddc-ui-pum'
Jetpack 'Shougo/ddc-source-around'
Jetpack 'Shougo/ddc-source-lsp'
Jetpack 'uga-rosa/ddc-source-vsnip'
Jetpack 'Shougo/ddc-filter-matcher_head'
Jetpack 'Shougo/ddc-filter-matcher_length'
Jetpack 'Shougo/ddc-filter-sorter_rank'
Jetpack 'LumaKernel/ddc-source-file'
Jetpack 'matsui54/denops-popup-preview.vim'
Jetpack 'matsui54/denops-signature_help'
"Jetpack 'hrsh7th/vim-vsnip-integ'
" nvim-cmp
"Jetpack 'hrsh7th/nvim-cmp'
"Jetpack 'hrsh7th/cmp-nvim-lsp'
"Jetpack 'hrsh7th/cmp-buffer'
"Jetpack 'hrsh7th/cmp-path'
"Jetpack 'hrsh7th/cmp-cmdline'
"Jetpack 'hrsh7th/cmp-vsnip'
"Jetpack 'hrsh7th/cmp-nvim-lsp-signature-help'
Jetpack 'hrsh7th/vim-vsnip'
" lsp
Jetpack 'neovim/nvim-lspconfig'
Jetpack 'williamboman/mason.nvim'
Jetpack 'williamboman/mason-lspconfig.nvim'
Jetpack 'vim-skk/skkeleton'
Jetpack 'itchyny/lightline.vim'
Jetpack 'yasunori0418/statusline_skk.vim'
Jetpack 'nvim-lua/plenary.nvim' " To use lua plugins
Jetpack 'nvim-telescope/telescope.nvim'
Jetpack 'nvim-telescope/telescope-file-browser.nvim'
Jetpack 'nvim-tree/nvim-web-devicons'
Jetpack 'rust-lang/rust.vim'
" Colerscheme
Jetpack 'arcticicestudio/nord-vim'
Jetpack 'cocopon/iceberg.vim'
Jetpack 'EdenEast/nightfox.nvim'
Jetpack 'joshdick/onedark.vim'
Jetpack 'preservim/nerdcommenter' " Comment out
Jetpack 'mvllow/modes.nvim' " mode
Jetpack 'nvim-treesitter/nvim-treesitter' " Syntacs height light
"Jetpack 'rcarriga/nvim-notify' "notification
Jetpack 'windwp/nvim-autopairs'
Jetpack 'akinsho/toggleterm.nvim'
Jetpack 'lukas-reineke/indent-blankline.nvim'
Jetpack 'petertriho/nvim-scrollbar'
call jetpack#end()

" colorscheme----------------------------------------
set termguicolors
colorscheme fuyu
"colorscheme iceberg

" nvim-cmp----------------------------------------
":luafile ~/.config/nvim/lua/plugins/nvim-cmp.lua

" ddc----------------------------------------

call ddc#custom#patch_global('ui', 'pum')

call ddc#custom#patch_global('sources', ['around','skkeleton','lsp','file','vsnip'])

call ddc#custom#patch_global('sourceOptions', #{
    \ _: #{
    \   matchers: ['matcher_head','matcher_length'],
    \   sorters: ['sorter_rank'],
    \ },
    \ around: #{
    \   mark: '[A]',
    \ },
    \ skkeleton: #{
    \   mark: '[SKK]',
    \   matchers: ['skkeleton'],
    \   sorters: [],
    \   isVolatile: v:true,
    \ },
    \ lsp: #{
    \   mark: '[LSP]',
    \   forceCompletionPattern: '\.\w*|:\w*|->\w*',
    \ },
    \ file: #{
    \   mark: '[F]',
    \   forceCompletionPattern: '\S/\S*',
    \ },
    \ vsinp: #{
    \   mark: '[vsnip]',
    \ },
    \ })
"call ddc#custom#patch_filetype(
    "\ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    "\ 'sourceOptions': {
    "\   'file': {
    "\     'forceCompletionPattern': '\S\\\S*',
    "\   },
    "\ },
    "\ 'sourceParams': {
    "\   'file': {
    "\     'mode': 'win32',
    "\   },
    "\ }})
call ddc#custom#patch_global('sourceParams', #{
      \   lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \   }
      \ })

let g:popup_preview_config = {
            \ 'delay': 2,
            \}

" Mappings----------------------------------------

 "<TAB>: completion.
"inoremap <silent><expr> <TAB>
"\ pumvisible() ? '<C-n>' :
"\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"\ '<TAB>' : ddc#map#manual_complete()
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-TAB>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

 "<S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
"inoremap <expr><CR>  pumvisible() ? '<C-y>' : '<CR>'

call ddc#enable()
call popup_preview#enable()
call signature_help#enable()

imap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'
smap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'

" skkeleton----------------------------------------
imap <silent> <C-j> <Plug>(skkeleton-toggle)
cmap <silent> <C-j> <Plug>(skkeleton-toggle)
autocmd User skkeleton-mode-changed redrawstatus

call skkeleton#config({
    \ 'eggLikeNewline': v:true,
    \ 'showCandidatesCount': 2,
    \ 'globalJisyo': expand('~/.skk/SKK-JISYO.L'),
    \ })

call skkeleton#register_kanatable('rom', {
    \ 'uu': 'escape',
    \ 'z\<Space>': ['\u3000', ''],
    \ 'z-': ['―', ''],
    \ '!':  ['！', ''],
    \ '&':  ['&', ''],
    \ '(':  ['（', ''],
    \ ')':  ['）', ''],
    \ '[':  ['「', ''],
    \ ']':  ['」', ''],
    \ '*':  ['*', ''], 
    \ 'z*': ['※', ''],
    \ '+':  ['+', ''],
    \ '/':  ['/', ''], 
    \ 'z/': ['・', ''],
    \ '<':  ['<', ''],
    \ '=':  ['=', ''],
    \ '>':  ['>', ''],
    \ '@':  ['@', ''],
    \ '\\': ['＼', ''],
    \ '{':  ['｛', ''],
    \ '|':  ['|', ''],
    \ '}':  ['｝', ''],
    \ '~':  ['~', ''],
    \ })

" LSP----------------------------------------
:luafile ~/.config/nvim/lua/plugins/lsp.lua


" Telescope----------------------------------------
nnoremap <C-p> <cmd>Telescope file_browser<cr>
:luafile ~/.config/nvim/lua/plugins/telescope.lua

" ligihtline----------------------------------------
 "set laststatus=2
 "set noshowmode

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'skk_mode' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \   },
    \ 'component_function': {
    \   'skk_mode': 'statusline_skk#mode',
    \   },
    \ }

call statusline_skk#option('display', {
    \ 'hiragana': 'あ',
    \ 'katakana': 'ア',
    \ 'hankaku-katakana': 'ｱｧ',
    \ 'zenkaku-alphabet': 'Ａ',
    \ 'alphabet': 'Aa',
    \ })

" modes----------------------------------------
:luafile ~/.config/nvim/lua/plugins/modes.lua

" nvim-notify----------------------------------------
" :luafile ~/.config/nvim/lua/plugins/notify.lua

" treesitter----------------------------------------
:luafile ~/.config/nvim/lua/plugins/treesitter.lua

" toggleterm----------------------------------------
:luafile ~/.config/nvim/lua/plugins/toggleterm.lua

" indent----------------------------------------
:luafile ~/.config/nvim/lua/plugins/indent.lua

" Rust----------------------------------------
let g:rustfmt_autosave = 1

" autopairs----------------------------------------
:luafile ~/.config/nvim/lua/plugins/autopairs.lua

" scrollbar----------------------------------------
:luafile ~/.config/nvim/lua/plugins/scrollbar.lua
