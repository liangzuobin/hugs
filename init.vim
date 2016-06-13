" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
" Plug 'Shougo/neocomplete'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/nyaovim-markdown-preview'
" Plug 'sheerun/vim-polyglot'
call plug#end()

" general setting
set nu
set clipboard+=unnamed
set shiftwidth=8
set incsearch
set hlsearch
set noexpandtab
set laststatus=2
set splitbelow
set splitright
set showcmd
set nowrap
set background=dark

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme onedark

" general mapping start
nmap <Ctrl-A> <Nop>
let mapleader = ","
nnoremap <silent> <Leader>rv :vsp ~/.vimrc<CR>
nnoremap <silent> <Leader>tn :tabnew
nnoremap <silent> <Leader>[ :tabprev<CR>
nnoremap <silent> <Leader>] :tabnext<CR>
nnoremap <silent> <Leader>b[ :bprevious<CR>
nnoremap <silent> <Leader>b] :bnext<CR>
nmap t<Enter> :bo sp term://zsh\|resize 5<CR>i

" ctrl-p 
let g:ctrlp_map = ''
nmap <silent> <C-x><C-p> :CtrlP<CR>
nmap <silent> <C-x><C-b> :CtrlPBuffer<CR>
nmap <silent> <C-x><C-o> :CtrlPCurWD<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|DS_Store\|git\|vender',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" nerdtree
nmap <silent> <C-x><C-t> :NERDTreeToggle<CR>

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
nmap q <Plug>(easymotion-s)
nmap q <Plug>(easymotion-s2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:my_cr_function() abort
	" return deoplete#mappings#close_popup() . "\<CR>"
	return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
set completeopt-=preview

" noesnippet
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
" if has('conceal')
" 	set conceallevel=2 concealcursor=niv
" endif
" if has('conceal')
" 	set conceallevel=2 concealcursor=niv
" endif

" airline
if !has('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='sol'

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5

" go-lang
let g:go_fmt_command="gofmt"
let g:go_snippet_engine="neosnippet"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <silent> <Leader>i :GoImports<CR>
au FileType go nmap <silent> <leader>ra <Plug>(go-run)
au FileType go nmap <silent> <leader>rc :GoRun! % <CR>
au FileType go nmap <silent> <leader>bd <Plug>(go-build)
au FileType go nmap <silent> <Leader>ds <Plug>(go-def-split)
au FileType go nmap <silent> <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <silent> <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <silent> <Leader>rn <Plug>(go-rename)
au FileType go nmap <silent> <Leader>vt <Plug>(go-vet)
au FileType go nmap <silent> <Leader>lt <Plug>(go-lint)

" rust-lang
let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = '/Users/liangzuobin/.cargo/bin/racer'
let $RUST_SRC_PAT = '/Users/liangzuobin/Code/Rust/rust/src/'
