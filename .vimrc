" various
colorscheme obsidian2  " the theme
filetype plugin indent on  " enable file type detection
syntax enable

" settings
set autoindent  " follow indentation of last line
set autoread  " auto-detect file changes
set backspace=2
set clipboard+=unnamed  " use the normal clipboard
set completeopt=menuone  " autocompletion popup menu
set equalalways
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set foldcolumn=4  " width of the column used to indicate folds
set foldlevelstart=42  " no closed folds at start
set foldmethod=indent  " automatic folding of indented blocks
set foldnestmax=3  " maximum number of nested folds
set gdefault  " substitution is done on all matches in a line
set guioptions+=a  " visual selection goes to clipboard
set guioptions-=e  " better looking window tabs
set guioptions-=L  " remove left-hand scroll
set guioptions-=m  " remove menu bar
set guioptions-=r  " remove right-hand scroll
set guioptions-=T  " remove toolbar
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
set showtabline=2  " always show tab page labels
set smartcase  " if capital letter, search is case-sensitive
set smarttab
set tabstop=4
set wildmenu  " enhanced auto-completion for the command line
set writebackup  " create backup file while editing

" .. conditional settings
if has('win32') || has('win32unix')
	set guifont=Consolas:h11
endif

" key mappings
" .. browser-like tabs
nnoremap  <C-tab> 		:tabnext<CR>
nnoremap  <C-S-tab> 	:tabprevious<CR>
nnoremap  <C-t> 		:tabnew<CR>
inoremap  <C-tab> 		<ESC>:tabnext<CR>i
inoremap  <C-S-tab> 	<ESC>:tabprevious<CR>i
inoremap  <C-t> 		<ESC>:tabnew<CR>

" .. prevent vim from removing tab-only lines
inoremap  <CR>			<CR>42<BS><BS>
nnoremap  o				o42<BS><BS>
nnoremap  O				O42<BS><BS>

" .. no habit should die!
inoremap  <C-s>			<ESC>:w<CR>
nnoremap  <C-s>			:w<CR>

" event hooks
" .. start with a maximised window
if has('gui_running')
	if has('win32') || has('win32unix')
		" autocmd GUIEnter * simalt ~x
		" gvimfullscreen_win32
		autocmd GUIEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
	else
		autocmd GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
	endif
endif

" .. remember folds and cursor position
autocmd BufWinLeave *.css,*.js,*.less,*.php,*.py mkview
autocmd BufWinEnter *.css,*.js,*.less,*.php,*.py silent loadview

" plugins
" .. pathogen
execute pathogen#infect()
" .. neocomplcache
let g:neocomplcache_enable_at_startup=1

