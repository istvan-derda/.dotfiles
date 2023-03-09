source $VIMRUNTIME/defaults.vim
set mouse=a
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set laststatus=2

" edit and source .vimrc with <esc>+'confe' and <esc>+'confr'
nnoremap confe :e $MYVIMRC<CR>
nnoremap confr :source $MYVIMRC<CR>

" vim-plug https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'morhetz/gruvbox' " gruvbox theme

Plug 'airblade/vim-gitgutter' " show changed lines

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown preview

" Rust Plugins as described here https://blog.logrocket.com/configuring-vim-rust-development/
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'timonv/vim-cargo'

call plug#end()

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox " enable gruvbox
set background=dark " gruvbox dark mode

""" configure coc language server plugin

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" configure rustfmt
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
