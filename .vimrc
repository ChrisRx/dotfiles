set tabstop=4 shiftwidth=4 expandtab backspace=2
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap jk <Esc>
set splitbelow
set splitright
set number
let mapleader = ","
set directory=$HOME/.vim/swap/

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
colorscheme badwolf
let badwolf_darkgutter = 1

" Shift tab for command mode and insert mode
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

" Reselect last visual selected lines
nnoremap <leader>v V`]

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let g:NERDShutUp=1

" Persistent UNDO
if v:version >= 703
	set undofile
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
endif

" Yank, Comment, and Paste
nnoremap <Leader>cz yy:call NERDComment(1, "toggle")<CR>p
vnoremap <Leader>cz "yygv:call NERDComment(1, "toggle")<CR>`>p

let g:netrw_list_hide= '.*\.swp$,.*\.pyc$'

nnoremap <Leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" riotjs Syntax Highlighting
au BufRead,BufNewFile *.tag :set filetype=html

" Identation
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Redraw screen to remove highlighting
nnoremap <silent> <CR> :nohl<CR><CR>

" Move up and down on the same line when wraps
nnoremap j gj
nnoremap k gk

" Easier menu access
nnoremap ; :

" standard (javascript)
let g:syntastic_javascript_checkers = ['standard']
