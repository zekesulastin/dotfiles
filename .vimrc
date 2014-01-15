" .vimrc!  vim settings!

let $PYTHONPATH="/usr/lib/python3.3/site-packages"

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
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap
set undofile undodir=$HOME/.vim/undo
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
	set guifont="PragmataPro 10"
elseif $TERM =~ 'xterm-termite' || $TERM =~ 'rxvt-unicode-256color'
	set t_Co=256
	let g:zenburn_high_Contrast=1
	colorscheme zenburn
	highlight Comment cterm=italic
elseif $TERM =~ 'screen-256color'
	set t_Co=256
	let g:zenburn_high_Contrast=1
	colorscheme zenburn
	highlight Comment cterm=italic
	"I want my damn italics, even in tmux.
	set t_so=[7m
	set t_ZH=[3m
else
	set t_Co=8
	set bg=dark
endif

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

command W w !sudo tee % > /dev/null

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2
set noshowmode
