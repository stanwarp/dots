set nu
set relativenumber
set mouse=a
set ignorecase
set smartcase
set so=7
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set syntax=on
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'projekt0n/github-nvim-theme'

call plug#end()

colorscheme github_dark_default

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <tab> coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
