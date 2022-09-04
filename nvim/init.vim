let mapleader = "\<Space>"
set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set mouse=a
set clipboard+=unnamedplus
set expandtab
set history=1000
set ignorecase
set smartcase
syntax enable
set nowrap
set nocompatible
set iskeyword+=-
set foldmethod=indent

call plug#begin()
  Plug 'chrisbra/Recover.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/restore_view.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-commentary'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'sheerun/vim-polyglot' " for frameworks like react or svelte
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/neco-vim'
  Plug 'neoclide/coc-neco'
call plug#end()

colorscheme github_dark_default

""" coc 
  inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nnoremap <silent> K :call ShowDocumentation()<CR>
  
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
  
  autocmd CursorHold * silent call CocActionAsync('highlight')
  nmap <leader>rn <Plug>(coc-rename)
  
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>cl  <Plug>(coc-codelens-action)
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)
  command! -nargs=0 Format :call CocActionAsync('format')
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
  
  nnoremap <silent><nowait> <leader>.a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  " nnoremap <silent><nowait> <leader>.e  :<C-u>CocList extensions<cr>
  " Show commands.
  " nnoremap <silent><nowait> <leader>.c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <leader>.o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <leader>.s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <leader>.j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <leader>.k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <leader>.p  :<C-u>CocListResume<CR>
"""
""" lightline
  let g:lightline = { 'colorscheme': 'powerlineish' }

  let g:lightline['active'] = {
        \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']],
        \   'right': [ [], [ 'gitbranch' ], [ 'filetype' ]]
        \ }
   let g:lightline['component'] = { 'filetype': '%{&filetype}' }
  let g:lightline['component_function'] = { 'gitbranch': 'fugitive#head' }
"""
