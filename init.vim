"github.com/josharian/impl vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neopairs.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'sheerun/vim-polyglot'
Plug 'eagletmt/ghcmod-vim'
Plug 'neco-ghc'
Plug 'schickling/vim-bufonly'
Plug 'othree/yajs.vim'
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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
" colorscheme onedark
set background=light
colorscheme solarized

" deoplete pupup menu colors
" hi Pmenu            guibg=#606060
" hi PmenuSel         guifg=#dddd00 guibg=#1f82cd
" hi PmenuSbar        guibg=#d6d6d6
" hi PmenuThumb       guifg=#3cac3c

" general mapping start
nmap <Ctrl-A> <Nop>
let mapleader = ","
nnoremap <silent> <Leader>rv :vsp ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>tn :tabnew
nnoremap <silent> <Leader>[ :tabprev<CR>
nnoremap <silent> <Leader>] :tabnext<CR>
nnoremap <silent> <Leader>b[ :bprevious<CR>
nnoremap <silent> <Leader>b] :bnext<CR>
nmap t<Enter> :bo sp term://zsh\|resize 5<CR>

" ctrl-p 
let g:ctrlp_map = ''
nmap <C-x><C-p> :CtrlP<CR>
nmap <C-x><C-b> :CtrlPBuffer<CR>
nmap <C-x><C-o> :CtrlPCurWD<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|DS_Store\|git\|vendor',
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
let g:deoplete#enable_ignore_case = 1
let g:deoplete#max_menu_width = 120
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
function! s:my_cr_function() abort
	return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])
set completeopt-=preview
set completeopt+=noinsert
set completeopt+=noselect

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
" let g:airline_theme='sol'
" let g:airline_theme='oceanicnext'
if !has('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#left_alt_sep=' '
let g:airline#extensions#tabline#right_alt_sep=' '
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'x', 'y', 'z' ]
	\ ]

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5

" golang / vim-go
let g:go_fmt_command="gofmt"
let g:go_def_mode = "godef"
" let go_metalinter_autosave = 1
" let g:go_metalinter_enabled = ['vet', 'errcheck']
" let g:go_metalinter_deadline = \"5s\"
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_snippet_engine="neosnippet"
let g:go_decls_includes = "func,type"
" let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"

au FileType go nmap <leader>al :GoAlternate<CR>
au FileType go nmap <leader>bd <Plug>(go-build)
au FileType go nmap <Leader>ce :GoCallees<CR> 
au FileType go nmap <Leader>cr :GoCallers<CR>
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>im :GoImports<CR>
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ld :GoDeclsDir<CR>
au FileType go nmap <Leader>lf :GoDecls<CR>
au FileType go nmap <leader>ra <Plug>(go-run)
au FileType go nmap <leader>rc :GoRun! % <CR>
au FileType go nmap <Leader>rn <Plug>(go-rename)
au FileType go nmap <Leader>tc :GoTestCompile<CR>
au FileType go nmap <Leader>tf :GoTestFunc<CR>


" rust-lang
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1
set hidden
let g:racer_cmd = '/Users/liangzuobin/.cargo/bin/racer'
let $RUST_SRC_PAT = '/Users/liangzuobin/Code/Rust/rust/src/'

au FileType rust nmap <Leader>rr :RustRun<CR>
au FileType rust nmap <Leader>rc :RustRun!<CR>

" haskell
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" g:necoghc_enable_detailed_browse=1

" python
let g:python_host_prog = '/urs/local/bin/python3'
