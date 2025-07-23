set nocompatible
set nu
set wildmenu
set wildmode=list:longest,list:full
set virtualedit=all
set cursorline
set laststatus=2
set scrolloff=15
set sidescrolloff=10
set showmode
set ignorecase

highlight CursorLine ctermbg=darkgrey guibg=#303030 term=none cterm=none

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'bfrg/vim-c-cpp-modern'
Plug 'tikhomirov/vim-glsl'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" C/C++
autocmd FileType c,cpp nnoremap <buffer> K :LspHover<CR>
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" remaps / macros
" normal mode
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :below terminal<CR>
nnoremap <C-k> :LspHover<CR>
nnoremap <C-g> :LspDefinition<CR>zz
" insert mode
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <silent> <C-k> <C-o>:LspSignatureHelp<CR>
inoremap <silent> ( (<C-o>:LspSignatureHelp<CR>
inoremap <silent> , ,<C-o>:LspSignatureHelp<CR>
inoremap <silent> ) )<C-o>:LspSignatureHelp<CR>

" configs / let
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:lsp_diagnostics_echo_cursor = 1

