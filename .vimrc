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
set guifont=monospace\ 11
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
set nowrap  " better for vsplit
set number
set omnifunc=syntaxcomplete#Complete  " native auto-completion
set ruler
set shell=/bin/bash  " prevent fish from taking over
set shiftround  " < and > go for multiples of shiftwidth
set shiftwidth=4  " width of indentation
set showtabline=2  " always show tab page labels
set smartcase  " if capital letter, search is case-sensitive
set smarttab
set splitbelow  " new :split is below current
set splitright  " new :vsplit is to the right of the current
set tabstop=4
set wildignore+=*/development/env/*  " because virtualenv
set wildignore+=*/meta/env/*
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

" .. IPA
inoremap  <c-p>			<nop>

inoremap  <c-p>td		t̪
inoremap  <c-p>dd		d̪
inoremap  <c-p>tr		ʈ
inoremap  <c-p>dr		ɖ
inoremap  <c-p>gl		ʔ

inoremap  <c-p>nd		n̪
inoremap  <c-p>nr		ɳ
inoremap  <c-p>nj		ɲ
inoremap  <c-p>ng		ŋ

inoremap  <c-p>rt		ɾ
inoremap  <c-p>rr		ɽ

inoremap  <c-p>fi		ɸ
inoremap  <c-p>th		θ
inoremap  <c-p>dh		ð
inoremap  <c-p>sd		s̪
inoremap  <c-p>zd		z̪
inoremap  <c-p>sh		ʃ
inoremap  <c-p>zh		ʒ
inoremap  <c-p>ga		ɣ
inoremap  <c-p>hv		ɦ

inoremap  <c-p>lz		ɮ

inoremap  <c-p>vl		ʋ

inoremap  <c-p>lb		ɬ
inoremap  <c-p>lr		ɭ
inoremap  <c-p>ly		ʎ

inoremap  <c-p>I		ɪ
inoremap  <c-p>i-		ɨ
inoremap  <c-p>up		ʊ
inoremap  <c-p>o-		ɵ
inoremap  <c-p>yy		ə
inoremap  <c-p>ep		ɛ
inoremap  <c-p>uv		ʌ
inoremap  <c-p>oc		ɔ
inoremap  <c-p>ae		æ
inoremap  <c-p>ao		ɑ

inoremap  <c-p>-:		ː
inoremap  <c-p>-.		ˑ
inoremap  <c-p>-'		ˈ
inoremap  <c-p>-h		ʰ
inoremap  <c-p>-j		ʲ
inoremap  <c-p>-n		ⁿ
inoremap  <c-p>-w		ʷ


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
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType css nnoremap <buffer> <localleader>c mCI/* <esc>A */<esc>`Clll
augroup END

" .. javascript
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType javascript nnoremap <buffer> <localleader>c mCI// <esc>`Clll
	autocmd FileType javascript setlocal foldmethod=marker
	autocmd FileType javascript setlocal foldmarker={,}
	autocmd FileType javascript setlocal foldtext=GetCleanFoldText()
augroup END

" .. java
augroup filetype_java
	autocmd!
	autocmd FileType java nnoremap <buffer> <localleader>c mCI// <esc>`Clll
	autocmd FileType java setlocal foldmethod=marker
	autocmd FileType java setlocal foldmarker={,}
	autocmd FileType java setlocal foldtext=GetCleanFoldText()
augroup END

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
	autocmd FileType python setlocal noexpandtab softtabstop=0 tabstop=4  " counter ftplugin/python.vim
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	" autocmd FileType python setlocal completeopt+=preview
	autocmd FileType python nnoremap <buffer> <localleader>c mCI# <esc>`Cll
	autocmd FileType python nnoremap <buffer> <localleader>C g_F#xx
augroup END

" .. tsv
augroup filetype_tsv
	autocmd!
	autocmd BufRead,BufNewFile *.tsv setlocal tabstop=24
augroup END


" functions
" .. defines the folded line content
function! GetCleanFoldText()
	let line = getline(v:foldstart)
	let line = substitute(line, "\t", "    ", 'g')
	return line
endfunction

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

" .. ack
nnoremap  <leader>a		:Ack 

" .. ctrlp
let g:ctrlp_show_hidden = 1  " do not ignore .gitignore

" .. gundo
let g:gundo_prefer_python3=1  " problems with transition to 3
let g:gundo_help=0  " disable help text
nnoremap  <leader>u 	:GundoToggle<cr>

" .. latex-box
let g:LatexBox_Folding=1  " enable folding
let g:LatexBox_latexmk_options="-xelatex"

" .. neocomplete (former neocomplcache)
let g:neocomplete#enable_at_startup=1  " start it
let g:neocomplete#enable_ignore_case=0  " case-sensitive

" .. scratch
let g:scratch_autohide=1
let g:scratch_insert_autohide=0
let g:scratch_height=10
let g:scratch_top=1
let g:scratch_horizontal=1
let g:scratch_no_mappings=1

nmap  <leader>s		<plug>(scratch-insert-reuse)
xmap  <leader>s		<plug>(scratch-selection-reuse)

