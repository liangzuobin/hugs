" autosource config on exit
au BufLeave $MYVIMRC :source $MYVIMRC
"Colorscheme
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"General start
set nu "show row numbers
syntax on "syntax highlight
set nowrap
set incsearch
"set ruler
set smartindent
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set hlsearch
set noexpandtab
set showmatch
set laststatus=2
set splitbelow
set splitright
set clipboard+=unnamed
set showcmd
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,default,ucs-bom,latin1
set nocompatible 
"set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"General end
"
"Vundle start
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'The-NERD-tree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
"Bundle 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'ctrlp.vim'
Bundle "Markdown"
Bundle "ragtag.vim"
call vundle#end()
filetype plugin indent on
filetype plugin on
"Vundle end
"
"Plugins Settings start
"vim-go settings
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "ultisnips"
let g:go_jump_to_error = 0 "don't show error window after run
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
"YCM settings
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_invoke_completion = '<C-.>'
"ctrlp setttings
nmap <silent> <C-p><C-p> :CtrlP<CR>
nmap <silent> <C-p><C-o> :CtrlPCurWD<CR>
" UltiSnips setting
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-s><C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
"NERD-tree settings
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
"Plugins Settings end
"
"Key mapping start
let mapleader = ","
nnoremap <silent> <Leader>rv :vsp ~/.vimrc<CR>
"nnoremap <Leader>t :tabnew
nnoremap <Leader>[ :tabprev<CR>
nnoremap <Leader>] :tabnext<CR>
"noremap <Leader>w :w<CR>
"noremap <Leader>q :q!<CR>
"Key mapping end
"
"vim-go custom mappings
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

"for gocode
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
" For airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '

"set noshowmode for airline
" let g:airline#extensions#default#section_truncate_width = {}
" let g:airline#extensions#default#layout = [
"   \ ['c'],
"   \ []
"   \ ]
let g:airline#extensions#default#layout = [
\ [ 'a', 'b', 'c' ],
\ [ 'b', 'a' ]
\ ]

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1
let g:airline_powerline_fonts=0
let g:airline_mode_map = {}
" close the scratch preview 
set completeopt-=preview
