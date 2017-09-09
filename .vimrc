language en_US.UTF-8
set nocompatible              " be iMproved, required                                                              
set nobackup                  " Don't keep backup file
set clipboard=unnamed        " Yank and paste with the system clipboard
set cursorline
set number
set relativenumber
set cursorcolumn
set so=7

syntax enable

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jlanzarotta/bufexplorer'

call plug#end()

"change mapleader
let mapleader=","
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc']

"List last opened files
nmap <leader>l :browse oldfiles<CR>

"Easy buffet navigation?
nmap <leader>b :buffers<CR>:buffer<Space>

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

colorscheme gruvbox
set background=dark

"CtrlP
"let g:ctrlp_map = '<c-p>'  
"let g:ctrlp_cmd = 'CtrlP'  
"let g:ctrlp_working_path_mode = 'ra' 
"let g:ctrlp_switch_buffer = 'et'

"Working with buffers      
set hidden                 
nnoremap bn :bnext<CR>     
nnoremap bp :bprev<CR>     
nnoremap bd :bdelete<CR>   
nnoremap bl :BufExplorer<CR>
nnoremap bl :buffers<CR>:buffer<Space>

" easy opening files:
nmap <leader>e :!ls<CR>:e
