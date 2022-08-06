let mapleader = ","
inoremap jj <ESC>
function Meow()
  echom "Meow!"
endfunction
call plug#begin()

if (!exists('g:vscode'))
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'ms-jpq/chadtree'

endif
call plug#end()

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
endif

set completeopt=menu,menuone,noselect
set title
set bg=dark
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set noshowcmd
set tabstop=2
set shiftwidth=2
set expandtab
" Some basics:
 set nocompatible
 filetype plugin on
 syntax on
 set encoding=utf-8
 set number relativenumber
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
 set splitbelow splitright

nmap <Leader>s <Plug>(easymotion-s)
let g:EasyMotion_do_mapping = 0 " Disable default mappings 
let g:EasyMotion_smartcase = 1

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

 " Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
       set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <leader>h :call ToggleHiddenAll()<CR>

setlocal shiftwidth=2 tabstop=2
" Adding the custom source to unite
let g:webdevicons_enable_unite = 1

" Adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts = 1

" AIRLINE SETTINGS
let g:airline_theme='sol'
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'
" let g:airline_right_sep = '☠'

if exists('g:vscode')
else
    let g:coq_settings = { 'auto_start': v:true }
    " ordinary neovim
endif
