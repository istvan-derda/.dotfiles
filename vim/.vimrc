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

call plug#end()

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox " enable gruvbox
set background=dark " gruvbox dark mode
