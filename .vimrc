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
set guicursor+=a:blinkon0  " Diaspar's central computer does not blink
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
set nocindent  " cindent does not behave well with js
set noerrorbells visualbell t_vb=
set number
set omnifunc=syntaxcomplete#Complete  " native auto-completion
set ruler
set shell=/bin/bash  " prevent fish from taking over
set shiftround  " < and > go for multiples of shiftwidth
set shiftwidth=4  " width of indentation
set showtabline=2  " always show tab page labels
set smartcase  " if capital letter, search is case-sensitive
set smarttab
set tabstop=4
set wildignore+=*/build/*  " because javascript
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*
set wildmenu  " enhanced auto-completion for the command line
set writebackup  " create backup file while editing

" .. conditional settings
if has('win32') || has('win32unix')
	set guifont=Consolas:h11
endif

" .. global variables
let g:netrw_liststyle=3  " good tree

" key mappings
" .. browser-like tabs
nnoremap  <c-tab> 		:tabnext<cr>
nnoremap  <c-s-tab> 	:tabprevious<cr>
nnoremap  <c-t> 		:tabnew<cr>
inoremap  <c-tab> 		<esc>:tabnext<cr>i
inoremap  <c-s-tab> 	<esc>:tabprevious<cr>i
inoremap  <c-t> 		<esc>:tabnew<cr>

" .. prevent vim from removing tab-only lines
inoremap  <cr>			<cr>42<bs><bs>
nnoremap  o				o42<bs><bs>
nnoremap  O				O42<bs><bs>

" .. no habit should die!
inoremap  <c-s>			<esc>:w<cr>
nnoremap  <c-s>			:w<cr>

" .. easier :noh
nnoremap  <leader><space>	:noh<cr>

" .. spells
nnoremap  <leader>en	:setlocal spell! spelllang=en_gb<cr>

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

" .. recognise certain file extensions
augroup bufread_less
	autocmd!
	autocmd BufRead,BufNewFile *.less set filetype=css
augroup END

augroup bufread_md
	autocmd!
	autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

" .. remember folds and cursor position
augroup bufwinenter_code
	autocmd!
	autocmd BufWinEnter *.css,*.js,*.less,*.php,*.py silent loadview
augroup END

augroup bufwinleave_code
	autocmd!
	autocmd BufWinLeave *.css,*.js,*.less,*.php,*.py mkview
augroup END

" .. css
augroup filetype_css
	autocmd!
	autocmd FileType css nnoremap <buffer> <localleader>c mCI/* <esc>A */<esc>`Clll
augroup END

" .. javascript and java
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript,java nnoremap <buffer> <localleader>c mCI// <esc>`Clll
	autocmd FileType javascript,java setlocal foldmethod=marker
	autocmd FileType javascript,java setlocal foldmarker={,}
	autocmd FileType javascript,java setlocal foldtext=GetCleanFoldText()
augroup END

function! GetCleanFoldText()  " defines the folded line content
	let line = getline(v:foldstart)
	let line = substitute(line, "\t", "    ", 'g')
	return line
endfunction

" .. markdown
augroup filetype_markdown
	autocmd!
	autocmd FileType markdown setlocal formatoptions+=c  " auto-wrap comments
	autocmd FileType markdown setlocal formatoptions+=t  " and non-comments
	autocmd FileType markdown setlocal textwidth=80  " to be <= 80 chars wide
augroup END

" .. python
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c mCI# <esc>`Cll
	autocmd FileType python nnoremap <buffer> <localleader>C g_F#xx
augroup END

" functions
" .. function to delete current file's view
" .. http://www.vim.org/scripts/script.php?script_id=5109
function! DeleteView()
	let path = fnamemodify(bufname('%'),':p')
	let path = substitute(path, '=', '==', 'g')
	if empty($HOME)
	else
		let path = substitute(path, '^'.$HOME, '\~', '')
	endif
	let path = substitute(path, '/', '=+', 'g') . '='
	let path = &viewdir.'/'.path
	call delete(path)
	echom "Deleted: ".path
endfunction

" plugins
" .. pathogen
execute pathogen#infect()
Helptags  " re-generate plugins' docs

" .. neocomplcache
let g:neocomplcache_enable_at_startup=1

" .. latex-box
let g:LatexBox_Folding=1  " enable folding

