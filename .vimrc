" General setup
set nocompatible
syntax on
set laststatus=2
set autoindent
set autowrite
set autoread
set nu
set tabstop=2
set shiftwidth=2
set shiftround
set ttyfast
set expandtab
set hlsearch
set incsearch
set encoding=utf-8
set bs=2
set nojoinspaces

" Disable Background Color Erase (BCE) so that color schemes work properly
" when Vim is used inside tmux and GNU screen.
" https://superuser.com/questions/457911/in-vim-background-color-changes-on-scrolling/588243
if &term =~ '256color'
    set t_ut=
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'l04m33/vlime', {'rtp': 'vim/'}
"Plugin 'kovisoft/paredit'
"Plugin 'vim-scripts/paredit.vim'
call vundle#end()
filetype plugin on
filetype indent on

""" vim-plug (https://github.com/junegunn/vim-plug)
" To install plugins: ':PlugInstall'
call plug#begin('~/.vim/plugged')
Plug 'jliu2179/vim-dark-meadow'
Plug 'fatih/molokai'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'
Plug 'wesgibbs/vim-irblack'
Plug 'rhysd/vim-wasm'
Plug 'sjl/badwolf'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
"Plug 'vim-airline/vim-airline'
"Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'tssm/fairyfloss.vim'
Plug 'soft-aesthetic/soft-era-vim'
Plug 'jamessan/vim-gnupg'
Plug 'ledger/vim-ledger'
call plug#end()

" colorscheme goodwolf
" colorscheme delek
" colorscheme ir_black
colorscheme badwolf

let mapleader = "="

" Airline/Powerline fonts
"let g:airline_powerline_fonts = 1

nnoremap ; :
nnoremap s :write<enter>

inoremap jk <esc>

nnoremap <c-j> :bn<enter>
nnoremap <c-k> :bp<enter>

nnoremap <Leader>d :bd<enter>
nnoremap <Leader>l :noh<enter>

nnoremap <Leader>ev :e ~/.vimrc<enter>
nnoremap <Leader>sv :source ~/.vimrc<enter>
inoremap <Leader>cl console.log()<esc>i

inoremap <Leader>N <ESC>:r!date<CR>
inoremap <Leader>D <ESC>:r!date +'\%Y/\%m/\%d'<CR>kddo

nnoremap <CR> o<ESC>

nnoremap qq vipgq

" js require
" TODO: .js autocmd
inoremap <leader>r <esc>Iconst <esc>WWi= require('<esc>A')
inoremap <leader>R <esc>0ywiconst <esc>A = require('<esc>pA')

" Disabled for the moment, since vlime uses it.
"nnoremap <enter> o<ESC>

let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'

" Backups
set undofile
set undodir=~/.vim/tmp/undo/
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set noswapfile

au BufRead,BufNewFile *.dat setfiletype ledger
