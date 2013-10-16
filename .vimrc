" various
colorscheme obsidian2  " the theme
filetype plugin indent on  " enable file type detection
syntax enable

" settings
set autochdir  " sync working dir
set autoindent  " follow indentation of last line
set autoread  " auto-detect file changes
set backspace=2
set clipboard+=unnamed  " use the normal clipboard
set equalalways
set encoding=utf-8
set fileencoding=utf-8
" set foldmethod=indent  " automatic folding of indented blocks
set guioptions+=a  " visual selection goes to clipboard
set guioptions-=m  " remove menu bar
set guioptions-=r  " remove right-hand scroll
set guioptions-=T  " remove toolbar
set guifont=Consolas:h11
set helplang=  " inglés por favor
set hlsearch  " highlight search matches
set ignorecase  " search is case-insensitive
set incsearch  " highlight search matches while typing
set nobackup  " do not hold backups after the file is written to
set nobomb  " without BOM
set noerrorbells visualbell t_vb=
set number
set omnifunc=syntaxcomplete#Complete  " native auto-completion
set ruler
set shiftwidth=4  " width of indentation
set smartcase  " if capital letter, search is case-sensitive
set smarttab
set tabstop=4
set wildmenu  " enhanced auto-completion for the command line
set writebackup  " create backup file while editing

" key mappings
" .. browser-like tabs
nnoremap  <C-tab> 		:tabnext<CR>
nnoremap  <C-S-tab> 	:tabprevious<CR>
nnoremap  <C-t> 		:tabnew<CR>
inoremap  <C-tab> 		<ESC>:tabnext<CR>i
inoremap  <C-S-tab> 	<ESC>:tabprevious<CR>i
inoremap  <C-t> 		<ESC>:tabnew<CR>

" event hooks
autocmd GUIEnter * simalt ~x  " start with a maximised window

" plugins
" .. pathogen
execute pathogen#infect()
" .. neocomplcache
let g:neocomplcache_enable_at_startup=1

