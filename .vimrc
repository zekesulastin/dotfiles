" .vimrc!  vim settings!

set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set autoread
set number
set ts=4
set sw=4
set laststatus=2
set backupdir=/home/zekesulastin/.vim/backup
set directory=/home/zekesulastin/.vim/swap
filetype on
syntax on
map Q gq
inoremap <C-U> <C-G>u<C-U>
let g:netrw_http_cmd='curl'
let g:netrw_http_xcmd='-o'
let g:netrw_silent=1

if has('mouse')
	set mouse=a
	set ttymouse=xterm2
endif

call pathogen#infect()

if has('gui_running')
	let g:zenburn_high_Contrast=1
	colorscheme zenburn
	let g:Powerline_symbols = 'fancy'
	let g:Powerline_colorscheme = 'default'
	set guifont=PragmataPro\ for\ Powerline\ 10
elseif $TERM =~ 'xterm-termite' || $TERM =~ 'rxvt-unicode-256color'
		set t_Co=256
		let g:zenburn_high_Contrast=1
		colorscheme zenburn
		highlight Comment cterm=italic
		let g:Powerline_symbols = 'fancy'
		let g:Powerline_colorscheme = 'default'
elseif $TERM =~ 'screen-256color'
		set t_Co=256
		let g:zenburn_high_Contrast=1
		colorscheme zenburn
		highlight Comment cterm=italic
		"I want my damn italics, even in tmux.
		set t_so=[7m
		set t_ZH=[3m
		let g:Powerline_symbols = 'fancy'
		let g:Powerline_colorscheme = 'default'
else
		set t_Co=8
		set bg=dark
		let g:Powerline_symbols = 'compatible'
		let g:Powerline_colorscheme = 'default'
endif

command W w !sudo tee % > /dev/null
