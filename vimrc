"autosource config on exit
au BufLeave $MYVIMRC :source $MYVIMRC

" Colorscheme
" Configure UI {
set term=screen-256color
set t_Co=256
set background=dark
let base16colorspace=256        " Access colors present in 256 colorspace
set nofoldenable                " disable code folding
" }
" colorscheme molokai
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
colorscheme onedark

"let g:molokai_original = 1
let g:rehash256 = 1
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
" set laststatus=2
" set showtabline=2
" set foldcolumn=2
" set ruler
set splitbelow
" Smartsign (type `3` and match `3`&`#`)
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
"let &colorcolumn=join(range(81,999),",")
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" General end
"
" Vundle start
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
Plugin 'The-NERD-tree'
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
" Bundle 'Lokaltog/vim-powerline'
" Plugin 'bling/vim-airline'
" Plugin 'godlygeek/tabular'
Plugin 'ctrlp.vim'
Bundle 'Markdown'
" Bundle 'ragtag.vim'
Bundle 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
" Plugin 'Auto-Pairs'
Plugin 'bufferlist.vim'
call vundle#end()
filetype plugin indent on
filetype plugin on
" Vundle end
" CtrlP disable its default keymap
let g:ctrlp_map = ''

" Plugins Settings start
" vim-go settings
let g:go_fmt_command="goimports"
let g:go_snippet_engine="neosnippet"
" let g:go_jump_to_error = 0 "don't show error window after run
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_build_constraints=1

" YCM settings
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_key_invoke_completion = '<C-.>'

" noesnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" UltiSnips setting
" let g:UltiSnipsExpandTrigger="<C-j>"
" let g:UltiSnipsListSnippets="<C-s><C-s>"
" let g:UltiSnipsJumpForwardTrigger="<C-j>"
" let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Extension
nmap <silent> <C-x><C-p> :CtrlP<CR>
nmap <silent> <C-x><C-o> :CtrlPCurWD<CR>
nmap <silent> <C-x><C-t> :NERDTreeToggle<CR>
nmap <silent> <C-x><C-g> :call BufferList()<CR>
" Plugins Settings end
"
" Key mapping start
let mapleader = ","
nnoremap <silent> <Leader>rv :vsp ~/.vimrc<CR>
nnoremap <Leader>tn :tabnew
nnoremap <Leader>[ :tabprev<CR>
nnoremap <Leader>] :tabnext<CR>
nnoremap <Leader>b[ :bprevious<CR>
nnoremap <Leader>b] :bnext<CR>
"noremap <Leader>w :w<CR>
"noremap <Leader>q :q!<CR>
" Key mapping end
"
" vim-go custom mappings
au FileType go nmap <silent> <Leader>im <Plug>(go-implements)
au FileType go nmap <silent> <Leader>in <Plug>(go-info)
au FileType go nmap <silent> <Leader>gd <Plug>(go-doc)
au FileType go nmap <silent> <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <silent> <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <silent> <leader>ra <Plug>(go-run)
au FileType go nmap <silent> <leader>rc :GoRun! % <CR>
au FileType go nmap <silent> <leader>fm :GoFmt<CR>
au FileType go nmap <silent> <leader>bd <Plug>(go-build)
" au FileType go nmap <silent> <leader>ts <Plug>(go-test)
au FileType go nmap <silent> <leader>ts :GoTest<CR>
au FileType go nmap <silent> <leader>co <Plug>(go-coverage)
au FileType go nmap <silent> <Leader>ds <Plug>(go-def-split)
au FileType go nmap <silent> <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <silent> <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <silent> <Leader>rn <Plug>(go-rename)

" for gocode
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
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" for neosnippet
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
nmap q <Plug>(easymotion-s)
nmap q <Plug>(easymotion-s2)
omap t <Plug>(easymotion-bd-tl)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

set completeopt-=preview
