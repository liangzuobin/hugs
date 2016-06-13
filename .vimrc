"autosource config on exit
au BufLeave $MYVIMRC :source $MYVIMRC

" colorscheme molokai
" set background=light
" colorscheme solarized

colorscheme onedark
" for onedark
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" color dracula

" General start
set nu
syntax on
set nowrap
set incsearch
set smartindent
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set hlsearch
set noexpandtab
set showmatch
set laststatus=2
" set showtabline=2
" set foldcolumn=2
" set ruler
set splitbelow
set splitright
set clipboard+=unnamed
set showcmd
" set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,default,ucs-bom,latin1
set nocompatible 
"set colorcolumn=80
set ttimeout
set ttimeoutlen=50
" General end

" Vundle start
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
Plugin 'The-NERD-tree'
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'bling/vim-airline'
" Plugin 'godlygeek/tabular'
Plugin 'ctrlp.vim'
Bundle 'Markdown'
" Bundle 'ragtag.vim'
" Bundle 'mxw/vim-jsx'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
" Plugin 'Syntastic'
" Plugin 'Auto-Pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on
filetype plugin on
" Vundle end

" Plugins Settings start
" airline
if !exists('g:airline_symbols')
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
" let g:airline#extensions#bufferline#enabled=0
" let g:airline_extensions = ['branch', 'tabline']
" let g:airline_powerline_fonts=1

" vim-go settings
" let g:go_fmt_command="goimports"
let g:go_fmt_command="gofmt"
let g:go_snippet_engine="neosnippet"
" let g:go_jump_to_error = 0 "don't show error window after run
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" YCM settings
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_invoke_completion = '<C-.>'

" syntastic
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" noesnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" disable ctrl + a
nmap <Ctrl-A> <Nop>

" Extension
" CtrlP disable its default keymap
let g:ctrlp_map = ''
nmap <silent> <C-x><C-p> :CtrlP<CR>
nmap <silent> <C-x><C-b> :CtrlPBuffer<CR>
nmap <silent> <C-x><C-o> :CtrlPCurWD<CR>
nmap <silent> <C-x><C-t> :NERDTreeToggle<CR>

" Key mapping start
let mapleader = ","
nnoremap <silent> <Leader>rv :vsp ~/.vimrc<CR>
nnoremap <silent> <Leader>tn :tabnew
nnoremap <silent> <Leader>[ :tabprev<CR>
nnoremap <silent> <Leader>] :tabnext<CR>
nnoremap <silent> <Leader>b[ :bprevious<CR>
nnoremap <silent> <Leader>b] :bnext<CR>

" vim-go custom mappings
" au FileType go nmap <silent> <Leader>im <Plug>(go-implements)
au FileType go nmap <silent> <Leader>i :GoImports<CR>
" au FileType go nmap <silent> <Leader>in <Plug>(go-info)
" au FileType go nmap <silent> <Leader>gd <Plug>(go-doc)
" au FileType go nmap <silent> <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <silent> <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <silent> <leader>ra <Plug>(go-run)
au FileType go nmap <silent> <leader>rc :GoRun! % <CR>
" au FileType go nmap <silent> <leader>fm :GoFmt<CR>
au FileType go nmap <silent> <leader>bd <Plug>(go-build)
" au FileType go nmap <silent> <leader>ts <Plug>(go-test)
" au FileType go nmap <silent> <leader>ts :GoTest<CR>
au FileType go nmap <silent> <leader>co <Plug>(go-coverage)
au FileType go nmap <silent> <Leader>ds <Plug>(go-def-split)
au FileType go nmap <silent> <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <silent> <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <silent> <Leader>rn <Plug>(go-rename)
au FileType go nmap <silent> <Leader>vt <Plug>(go-vet)
au FileType go nmap <silent> <Leader>lt <Plug>(go-lint)

" for gocode, maybe
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

" neocomplete
" let g:acp_enableAtStartup = 0 " disable auto complete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" for neosnippet
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" Rust
let g:rustfmt_autosave = 1
" set hidden
let g:racer_cmd = '/Users/liangzuobin/.cargo/bin/racer'
let $RUST_SRC_PAT = '/Users/liangzuobin/Code/Rust/rust/src/'

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

" neocomplete popup color.
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=0


let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|DS_Store\|git\|vender',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" or
" set wildignore+=*/tmp/*,*/vendor/*,*/node_modules/*,*.so,*.swp,*.zip

set completeopt-=preview
