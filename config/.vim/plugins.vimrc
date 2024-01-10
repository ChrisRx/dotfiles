call plug#begin('~/.vim/plugged')

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'unblevable/quick-scope'

" Currently evaluating
Plug 'alvan/vim-closetag'
Plug 'derekwyatt/vim-fswitch'
Plug 'qpkorr/vim-bufkill'
"Plug 'tpope/vim-dispatch'
Plug 'hashivim/vim-terraform'
Plug 'dikiaap/minimalist'

"Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

call plug#end()

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" ==================== ctrlp ====================
let g:ctrlp_cmd = 'CtrlPMRU'

" ==================== quick-scope ====================
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ==================== vim-bracketed-paste ====================
let g:bracketed_paste_tmux_wrap = 0

" ==================== lightline ====================
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1
      \ },
      \ 'tabline': {
      \   'left': [ ['bufferline'] ]
      \ },
      \ 'component_expand': {
      \   'bufferline': 'LightlineBufferline',
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \ },
      \ }

" ==================== NerdTree ====================
let NERDTreeShowHidden=1
let g:NERDShutUp = 1
let NERDTreeIgnore = ['\.pyc$', '\.so$', '__pycache__$']
"let g:NERDTreeWinSize=60

" ==================== fswitch ====================
autocmd! BufEnter *.cc let b:fswitchdst = 'h,hpp'

" ==================== vim-bufkill ====================
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_info_mode = "gocode"
let g:go_def_mode = "gopls"

"let g:go_gopls_enabled = 0
"let g:go_metalinter_autosave_enabled = []
"let g:go_metalinter_enabled = []
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_diagnostic_warnings = 0
"let g:go_highlight_debug = 1

"let g:go_highlight_string_spellcheck = 0

let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_echo_command_info= 0
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 0

" ==================== rust.vim ====================
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
"let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
