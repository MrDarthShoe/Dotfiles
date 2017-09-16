language en_US.UTF-8
set nocompatible              " be iMproved, required                                                              
set clipboard=unnamed        " Yank and paste with the system clipboard
"set cursorline
set number
set so=12
filetype plugin on
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set ignorecase
set smartcase

execute "set <M-j>=\ej"
execute "set <M-k>=\ek"

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jlanzarotta/bufexplorer'

call plug#end()

"change mapleader
let mapleader=","

"Easy change one character
nnoremap <Space> cl

"Automatic two brackets
inoremap ( ()<Esc>T(i
inoremap { {}<Esc>T{i
inoremap [ []<Esc>T[i

"NerdTree settings
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc']
nmap <leader>r :NERDTreeFind<CR>

"YoucompleteMe 
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>jdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>


"Move lines around:
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

let g:tex_flavor = "latex"

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

colorscheme gruvbox
set background=dark

"CtrlP
let g:ctrlp_map = '<c-p>'  
let g:ctrlp_cmd = 'CtrlP'  
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_show_hidden = 1
nmap <leader>l :CtrlPMRU<CR>
nmap <leader>b :CtrlPBuffer<CR>

"Working with buffers      
set hidden                 
nnoremap bn :bnext<CR>     
nnoremap bp :bprev<CR>     
nnoremap bd :bdelete<CR>   
nnoremap bl :BufExplorer<CR>
"nnoremap bl :buffers<CR>:buffer<Space>

