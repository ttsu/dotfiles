set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'airblade/vim-gitgutter'
Bundle 'VimClojure'
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
Bundle 'The-NERD-tree'
let NERDTreeShowHidden=1
Bundle 'Screen-vim---gnu-screentmux'
let g:ScreenImpl='Tmux'
noremap <leader>S :ScreenShell
vnoremap <leader>s :ScreenSend<CR>
noremap <leader>s :ScreenSend<CR>

filetype plugin indent on

set autoindent
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set nu
set ic
set incsearch
set hls
set so=5
syntax on

set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [Type=%y]
set laststatus=2

autocmd vimenter * if !argc() | NERDTree | endif
