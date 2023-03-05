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

call plug#end()

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox " enable gruvbox
set background=dark " gruvbox dark mode

" rust configuratino
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB>
	\ pumbisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <[email protected]> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


