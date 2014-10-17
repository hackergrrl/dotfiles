" General goodness.
set nocompatible
syntax on
set laststatus=2
set ai
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set encoding=utf-8
set undofile
"set relativenumber   " cool, but slows down the terminal too much =(
set bs=2
set nofoldenable
set nojoinspaces
filetype plugin on
set colorcolumn=100

let mapleader = "-"
let maplocalleader = "_"


" Force myself to use 'jk' instead of <esc>
inoremap jk <esc>
inoremap <esc> <nop>

" Perform spell checking when composing mail or markdown.
augroup spell_check
  au!
  autocmd FileType mail setlocal spell
  autocmd FileType mail setlocal textwidth=72
  autocmd FileType markdown setlocal spell
augroup END

" Markdown.
augroup markdown
  au!
  autocmd FileType markdown nnoremap <LocalLeader>u yypVr-j
  autocmd FileType markdown nnoremap <LocalLeader>U yypVr=j
augroup END

" Hide GUI components in gvim.
set guioptions-=r
set guioptions-=m
set guioptions-=T

" Airline setup
" (https://github.com/bling/vim-airline)
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
let g:airline_powerline_fonts = 1

" vimrc management
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Formatting magicks.
"   Thanks Tiziano Santoro!
"   src: https://groups.google.com/a/google.com/d/msg/vi-users/MUfs7ZZuzeM/SPGCIwSrnYMJ
set formatoptions+=j

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Backups
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set noswapfile

" Handy key mappings.
nnoremap ; :
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>n :set nu!<CR>
nnoremap <Leader>l :noh<CR>

" Paste system clipboard (/w automatic toggle)
nnoremap <Leader>P :set paste!<CR>"+P:set paste!<CR>

" Use Javascript syntax highlighting for JSON.
augroup javascript
  au!
  autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

" Syntax highlighting colour preferences.
hi Comment ctermfg=magenta
hi Pmenu ctermfg=white ctermbg=darkmagenta
hi Search ctermbg=green ctermfg=black
hi LineNr ctermfg=grey cterm=bold

" Highlight trailing whitespace.
hi link localWhitespaceError Error
augroup trailing_whitespace
  au!
  au Syntax * syn match localWhitespaceError /\(zs\%#|\s\)\+$/ display
  au Syntax * syn match localWhitespaceError / \+\ze\t/ display
  au Syntax * syn match localWhitespaceError /\%>100v.\+/ display
augroup END

" Todo list highlighting.
" TODO: the todo.vim plugin should do this detection, not my vimrc
augroup todo_lang
  au!
  au BufRead,BufNewFile *.todo set filetype=todo-lang
  au Syntax todo-lang source $HOME/.vim/todo.vim
augroup END

" Highlight trailing whitespace.
" XXX: Wait, what? Again?
highlight ExtraWhitespace ctermbg=red guibg=red
augroup trailing_whitespace2
  au!
  au ColorScheme * highlight ExtraWhitespace guibg=red
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
augroup END

" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Preferred default colour scheme.
colorscheme badwolf
" colorscheme cake16
"colorscheme distinguished
"colorscheme molokai
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" Use a light theme for markdown editting.
augroup light_markdown_theme
  au!
  au FileType markdown colorscheme cake16
augroup END

" Buffer navigation shortcuts
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <Leader>d :bdel<CR>

" Sudo to write
" (Thank you, sjl!)
cnoremap w!! w !sudo tee % >/dev/null

" Easier splits
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>- :split<CR>
" easymotion
map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:Easymotion_smartcase = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap <silent> <Leader>ue :UltiSnipsEdit<CR>

