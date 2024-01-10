let mapleader = ","

" Exit insert mode
imap jk <Esc>

" Easier menu access and remap repeat motion
nnoremap ; :
nnoremap m ;
nnoremap M ,

" Standard Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Start/End Line Movement
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Move up and down on the same line when wraps
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Edit vimrc in split
nnoremap <Leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" Swap between buffers
nnoremap <C-g> :bnext<cr>
nnoremap <C-f> :bprev<cr>

" Redraw screen to remove highlighting
nnoremap <silent> <CR> :nohl<CR><CR>

" Split line
nnoremap S i<Enter><Esc>^

" Resize windows equally
nnoremap <Leader>w <C-w>=

" Toggle fold
nnoremap <space> za

" Reselect last visual selected lines (includes yank/paste)
nnoremap <silent> <leader>v `[v`]
vnoremap <silent> <leader>v v

vnoremap <silent> <leader>a :Tabularize /=<CR>

" close quickfix
nnoremap <Leader>a :cclose<CR>

" <3 Yank, Comment, and Paste <3
nnoremap <silent> <Leader>cz yy:call nerdcommenter#Comment(1, "toggle")<CR>p
vnoremap <silent> <Leader>cz Ygv:call nerdcommenter#Comment(1, "toggle")<CR>`>p

map <C-n> :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<cr>

nnoremap <Leader>h :call FSwitch('%', '')<CR>

noremap <silent> <Leader>bd :BD<cr>

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" vim-dispatch
nnoremap <silent> <Leader>b :w<CR>:Make<cr>

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

augroup go
  autocmd!
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>gb  <Plug>(go-build)
  autocmd FileType go nmap <silent> <leader>gi  <Plug>(go-imports)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
  "autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
